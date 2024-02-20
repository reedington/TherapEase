from django.contrib.auth import authenticate
from djoser.serializers import (
    UserSerializer as BaseUserSerializer, 
    UserCreateSerializer as BaseUserCreateSerializer,
    PasswordSerializer,
    )

from user.models import User
from Therapeaseapi.models import OTP
from Therapeaseapi.utils import InvalidOTP
from Therapeaseapi.enum import OTPReasonEnum

from rest_framework import serializers
from rest_framework_simplejwt.serializers import TokenObtainPairSerializer



class UserCreateSerializer(BaseUserCreateSerializer):
    class Meta(BaseUserCreateSerializer.Meta):
        fields = ["id", "password", "email"]


class UserUpdateSerializer(BaseUserCreateSerializer):
    class Meta(BaseUserCreateSerializer.Meta):
        fields = ["id", "username", "first_name", "last_name", "age", "gender", "struggle"]

    




class CustomTokenObtainPairSerializer(TokenObtainPairSerializer):
    """
    Custom token obtain pair serializer to allow authentication with email or username.
    """

    def validate(self, attrs):
        username = attrs.get("username")
        password = attrs.get("password")

        # Check if username is provided
        if not username:
            raise serializers.ValidationError("Username or email is required for authentication.")

        authenticate_kwargs = {'password': password}
        print
        # Check if the username is an email
        if "@" in username:
            authenticate_kwargs['email'] = username
        else:
            authenticate_kwargs['username'] = username

        user = authenticate(**authenticate_kwargs)

        if user:
            if not user.is_active:
                raise serializers.ValidationError("User account is disabled.")
            data = super().validate(attrs)
            return data

        raise serializers.ValidationError("Unable to log in with provided credentials.")




class UserRetrieveSerializer(BaseUserSerializer):
    
    class Meta:
        model = User
        fields = [
            "id", "password", "email", "first_name", "last_name", "age", "gender", "struggle", "is_active",
            "created_at", "updated_at"]
        
class SimpleUserRetrieveSerializer(BaseUserSerializer):
   
    class Meta:
        model = User
        fields = ["id", "first_name", "last_name", "email"]


class ActivationSerializer(serializers.Serializer):
    email = serializers.EmailField()
    code = serializers.CharField()

    def validate(self, attrs):
        validated_data = super().validate(attrs)

        try:
            self.user = User.objects.get(email=validated_data["email"])
            otp = OTP.objects.get(user=self.user,reason=OTPReasonEnum.ACTIVATE_ACCOUNT)
        except (User.DoesNotExist, OTP.DoesNotExist):
            raise InvalidOTP

        if not OTP.verify_otp(otp, (validated_data["code"])):
            raise InvalidOTP

        return attrs
    
class PasswordResetConfirmSerializer(PasswordSerializer):
    email = serializers.EmailField()
    code = serializers.CharField()
    
    def validate(self, attrs):
        validated_data = super().validate(attrs)

        try:
            self.user = User.objects.get(email=validated_data["email"])
            otp = OTP.objects.get(user=self.user,reason=OTPReasonEnum.FORGOT_PASSWORD)
        except (User.DoesNotExist, OTP.DoesNotExist):
            raise InvalidOTP

        if not OTP.verify_otp(otp, (validated_data["code"])):
            raise InvalidOTP

        return attrs
    

class PasswordResetVerifyOTPSerializer(serializers.Serializer):
    """To verify the OTP entered by user before requesting for new password"""
    
    email = serializers.EmailField()
    code = serializers.CharField()
    
    def validate(self, attrs):
        validated_data = super().validate(attrs)

        try:
            self.user = User.objects.get(email=validated_data["email"])
            otp = OTP.objects.get(user=self.user,reason=OTPReasonEnum.FORGOT_PASSWORD)
        except (User.DoesNotExist, OTP.DoesNotExist):
            raise InvalidOTP

        if not OTP.verify_otp(otp, (validated_data["code"])):
            raise InvalidOTP

        return attrs
    

