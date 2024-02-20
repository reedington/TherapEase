import requests

from django.utils.timezone import now
from django.contrib.auth import get_user_model
from django.utils.decorators import method_decorator
from django.views.decorators.csrf import csrf_exempt

from drf_yasg.utils import swagger_auto_schema


from rest_framework.response import Response
from rest_framework import status, viewsets
from rest_framework.decorators import action
from rest_framework.permissions import AllowAny, IsAuthenticated
from rest_framework_simplejwt.tokens import RefreshToken
from rest_framework.views import APIView

from djoser.views import UserViewSet as DjoserUserViewset
from djoser import signals
from djoser.compat import get_user_email
from djoser.conf import settings

from oauthlib.oauth2 import WebApplicationClient
from requests_oauthlib import OAuth2Session

from user.models import User
from user.serializers import PasswordResetVerifyOTPSerializer, UserRetrieveSerializer, UserUpdateSerializer
from Therapeaseapi.utils import logger
from Therapeaseapi.utils import CustomPagination
from Therapeaseapi.utils import response

from django.conf import settings

User = get_user_model()



class UserViewSet(DjoserUserViewset):

	def get_permissions(self):
		if self.action == "forgot_password_verify_otp":
			self.permission_classes = [AllowAny]
		return super().get_permissions()
		
		
	def perform_update(self, serializer):
		super().perform_update(serializer)

	
	def create(self, request, *args, **kwargs):
		if "email" in request.data:
			request.data["email"]= request.data["email"].lower()
		res = super().create(request, *args, **kwargs)

		response_data = response.success(message="User created successfully", status_code=201)

		return Response(response_data, status=status.HTTP_201_CREATED)

	
	def destroy(self, request, *args, **kwargs):
		instance = self.get_object()
		serializer = self.get_serializer(instance, data=request.data)
		serializer.is_valid(raise_exception=True)
		
		self.perform_destroy(instance)
		response_data = response.success(message="User Deleted successfully", status_code=204)
		return Response(response_data, status=status.HTTP_204_NO_CONTENT)
		
	@action(["post"], detail=False)
	def reset_password(self, request, *args, **kwargs):
		serializer = self.get_serializer(data=request.data)
		serializer.is_valid(raise_exception=True)
		user = serializer.get_user()
		if not user: user = serializer.get_user(is_active= False)

		if user:
			context = {"user": user}
			to = [get_user_email(user)]
			settings.EMAIL.password_reset(self.request, context).send(to)
			response_data = response.success(message="Reset password otp sent to email", status_code=204)
			return Response(response_data, status=status.HTTP_204_NO_CONTENT)
		
		return Response(response.error(message="User does not exist", code=404), status=status.HTTP_404_NOT_FOUND)
	
	@action(["post"], detail=False)
	def forgot_password_verify_otp(self, request, *args, **kwargs):
		"""To verify the OTP entered by user before requesting for new password"""
		
		serializer= PasswordResetVerifyOTPSerializer(data= request.data)
		serializer.is_valid(raise_exception= True)
		
		response_data = response.success(message="reset password otp verified", status_code=204)
		return Response(response_data, status=status.HTTP_204_NO_CONTENT)
	
	@action(["post"], detail=False)
	def reset_password_confirm(self, request, *args, **kwargs):
		serializer = self.get_serializer(data=request.data)
		serializer.is_valid(raise_exception=True)

		serializer.user.set_password(serializer.data["new_password"])
		if hasattr(serializer.user, "last_login"):
			serializer.user.last_login = now()
		serializer.user.is_active= True
		serializer.user.save()

		if settings.PASSWORD_CHANGED_EMAIL_CONFIRMATION:
			context = {"user": serializer.user}
			to = [get_user_email(serializer.user)]
			settings.EMAIL.password_changed_confirmation(self.request, context).send(to)
		response_data = response.success(message="password reset successful", status_code=204)
		return Response(response_data, status=status.HTTP_204_NO_CONTENT)
		
	
	

	@action(["post"], detail=False)
	def activation(self, request, *args, **kwargs):
		"""Simply overriding because we want to log users in upon a succesful account activation"""
	
		serializer = self.get_serializer(data=request.data)
		serializer.is_valid(raise_exception=True)
		user = serializer.user
		user.is_active = True
		user.save()

		signals.user_activated.send(
			sender=self.__class__, user=user, request=self.request
		)

		if settings.SEND_CONFIRMATION_EMAIL:
			context = {"user": user}
			to = [get_user_email(user)]
			settings.EMAIL.confirmation(self.request, context).send(to)

		refresh = RefreshToken.for_user(user)

		data = {
					"refresh": str(refresh),
					"access": str(refresh.access_token),
				}
		response_data = response.success(data=data, message="User account activated", status_code=201)

		return Response(response_data, status=status.HTTP_201_CREATED)
		
		


class UserUpdateAPIView(APIView):
	serializer_class = UserUpdateSerializer
	

	@swagger_auto_schema(request_body=UserUpdateSerializer)
	def put(self, request, *args, **kwargs):
		user = request.user  # Access the user object directly
		try:
			serializer = UserUpdateSerializer(instance=user, data=request.data)
			serializer.save()
			return Response(serializer.data, status=status.HTTP_200_OK)
		except Exception as e:
			return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)
	

# class GoogleOAuth2(APIView):
# 	"""
# 	Login with Google OAuth2
# 	"""
# 	permission_classes = (AllowAny,)

# 	@method_decorator(csrf_exempt)
# 	def dispatch(self, request, *args, **kwargs):
# 		return super().dispatch(request, *args, **kwargs)

# 	def get(self, request):
# 		client_id = settings.GOOGLE_OAUTH2_KEY
# 		scope = settings.GOOGLE_OAUTH2_SCOPE
# 		redirect_uri = request.query_params.get('redirect_uri')
# 		if redirect_uri not in settings.SOCIAL_AUTH_ALLOWED_REDIRECT_URIS:
# 			return Response(
# 				{'error': 'Wrong Redirect URI'},
# 				status=status.HTTP_400_BAD_REQUEST
# 			)
# 		google = OAuth2Session(client_id, scope=scope, redirect_uri=redirect_uri)
# 		try:
# 			authorization_url, state = google.authorization_url(
# 				settings.GOOGLE_AUTHORIZATION_BASE_URL,
# 				access_type='offline',
# 				prompt='select_account'
# 			)
# 			return Response({'authorization_url': authorization_url})
# 		except Exception as e:
# 			return Response(
# 				{'error': 'An error occurred while generating the authorization URL'},
# 				status=status.HTTP_500_INTERNAL_SERVER_ERROR
# 			)

# 	def post(self, request):
# 		client_id = settings.GOOGLE_OAUTH2_KEY
# 		client_secret = settings.GOOGLE_OAUTH2_SECRET

# 		state = request.data.get('state')
# 		code = request.data.get('code')
# 		redirect_uri = request.data.get('redirect_uri')

# 		client = WebApplicationClient(client_id)
# 		google = OAuth2Session(
# 			client_id,
# 			redirect_uri=redirect_uri,
# 			state=state
# 		)
# 		try:
# 			google.fetch_token(
# 				settings.GOOGLE_TOKEN_URL,
# 				client_secret=client_secret,
# 				code=code
# 			)
# 			user_info = google.get('https://www.googleapis.com/oauth2/v1/userinfo').json()
# 			user_first_name= user_info['given_name']
# 			user_last_name= user_info['family_name']
# 			user_email = user_info['email']
# 			try:
# 				user = User.objects.get(email=user_email)
# 			except User.DoesNotExist:
# 				user = User.objects.create_user(email=user_email, last_name=user_last_name, first_name=user_first_name, is_active=True)
# 			refresh_token = RefreshToken.for_user(user)
# 			return Response({
# 				'refresh': str(refresh_token),
# 				'access': str(refresh_token.access_token)
# 			})
# 		except Exception as e:
# 			return Response(
# 				{'error': 'An error occurred while exchanging the authorization code for tokens'},
# 				status=status.HTTP_500_INTERNAL_SERVER_ERROR
# 			)



class GoogleOAuth2(APIView):
	"""
	Login with Google OAuth2
	"""
	permission_classes = (AllowAny,)

	@method_decorator(csrf_exempt)
	def dispatch(self, request, *args, **kwargs):
		return super().dispatch(request, *args, **kwargs)

	def post(self, request):
		access_token = request.data.get('access_token')
		if not access_token:
			return Response({'error': 'Access token is required'}, status=status.HTTP_400_BAD_REQUEST)

		# Fetch user information from Google API
		google_user_info_url = 'https://www.googleapis.com/oauth2/v3/userinfo'
		headers = {'Authorization': f'Bearer {access_token}'}
		try:
			response = requests.get(google_user_info_url, headers=headers)
			response.raise_for_status()  # Raise exception for non-2xx status codes
			user_info = response.json()

			# Extract user data
			user_email = user_info.get('email')
			user_first_name = user_info.get('given_name')
			user_last_name = user_info.get('family_name')
			picture = user_info.get('picture')
            # Check if user already exists in the database
			try:
				user = User.objects.get(email=user_email)
			except User.DoesNotExist:
				# Create a new user if not found
				user = User.objects.create_user(email=user_email, first_name=user_first_name, last_name=user_last_name, is_active=True, avatar=picture)
			
			# Generate refresh token for the user
			refresh_token = RefreshToken.for_user(user)

			return Response({
				'refresh': str(refresh_token),
				'access': str(refresh_token.access_token)
			})
		except Exception as e:
			return Response({'error': str(e)}, status=status.HTTP_500_INTERNAL_SERVER_ERROR)

	

class EmailValidationView(APIView):
	permission_classes = [AllowAny]
	"""Handles validation of the email in real time"""
	def post(self, request, email):
		#check that the username is not already in the database
		if User.objects.filter(email=email).exists():
			return Response({'email_error':'sorry email already in use, Choose another one'}, status=409)
		return Response({'email_valid': True})