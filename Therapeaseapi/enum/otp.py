from django.db.models import TextChoices


class OTPReasonEnum(TextChoices):
    FORGOT_PASSWORD = "forgot_password"
    ACTIVATE_ACCOUNT = "activate_account"
    AUTHENTICATE_PAYMENT = "authenticate_payment"