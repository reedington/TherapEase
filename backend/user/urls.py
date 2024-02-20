from django.urls import path
from rest_framework_simplejwt import views as simple_jwt_views

from user.serializers import CustomTokenObtainPairSerializer
from user.views import (
    
    UserViewSet,
    EmailValidationView,
    GoogleOAuth2,
    UserUpdateAPIView

)

app_name = "user"
urlpatterns = [

    #onboarding
    path("login/", simple_jwt_views.TokenObtainPairView.as_view(), name="login"),
    path("refresh/", simple_jwt_views.TokenRefreshView.as_view(), name="refresh-token"),
    path("verify/", simple_jwt_views.TokenVerifyView.as_view(), name="verify-token"),
    path("users/", UserViewSet.as_view({"post": "create"}), name="users"),
    path('update    -profile/', UserUpdateAPIView.as_view(), name='user-update'),
    #path("update-profile/<str:id>/", UserViewSet.as_view({"put": "update"}), name="update"),
    path("me/", UserViewSet.as_view({"get": "me", "delete": "me", "patch": "me", "put": "me"})),
    path("activate-account/", UserViewSet.as_view({"post": "activation"}), name="activation"),
    path("resend-activation/", UserViewSet.as_view({"post": "resend_activation"}), name="resend_activation"),
    path("forgot-password/", UserViewSet.as_view({"post": "reset_password"}), name="forgot-password"),
    path("forgot-password-verify-otp/", UserViewSet.as_view({"post": "forgot_password_verify_otp"}), name="forgot-password-verify-otp"),
    path("forgot-password-confirm/", UserViewSet.as_view({"post": "reset_password_confirm"}), name="forgot-password-confirm"),
    path("change-password/", UserViewSet.as_view({"post": "set_password"}), name="change-password"),
    path('validate_email/<str:email>/', (EmailValidationView.as_view()), name='validate-email'),
    path('google-auth/', GoogleOAuth2.as_view(), name='google_oauth'),
    
]