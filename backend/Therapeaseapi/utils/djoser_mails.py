from templated_mail.mail import BaseEmailMessage

from Therapeaseapi.models import OTP
from Therapeaseapi.enum import OTPReasonEnum

class ActivationEmail(BaseEmailMessage):
    template_name = "emails/activation.html"

    def get_context_data(self):
        context = super().get_context_data()

        user = context.get("user")
        otp= OTP.generate_otp(user, OTPReasonEnum.ACTIVATE_ACCOUNT)
        context["code"] = otp["code"]
        context["timeout"] = otp["instance"].TIMEOUT//60
        return context
    

class PasswordResetEmail(ActivationEmail):
    template_name = "emails/password_reset.html"

    def get_context_data(self):
        context = super().get_context_data()

        user = context.get("user")
        otp= OTP.generate_otp(user, OTPReasonEnum.FORGOT_PASSWORD)
        context["code"] = otp["code"]
        context["timeout"] = otp["instance"].TIMEOUT//60
        return context