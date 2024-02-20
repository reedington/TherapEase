
from django.db import models

from django.utils import timezone
from django.core import signing
from django.db.models import TextChoices

from random import randrange
from uuid import uuid4


from Therapeaseapi.serializers.notification import NotificationSerializer
from Therapeaseapi.enum import OTPReasonEnum





class OTP(models.Model):
    TIMEOUT = 5 * 60
    OTP_LENGTH = 6

    id = models.UUIDField(default=uuid4, editable=False, unique=True, primary_key= True)

    user= models.ForeignKey("User", on_delete= models.CASCADE, related_name= "otps")
    reason= models.CharField(max_length= 50, choices= OTPReasonEnum.choices, default= OTPReasonEnum.ACTIVATE_ACCOUNT)
    code= models.CharField(max_length=128)
    timeout= models.DurationField(default=timezone.timedelta(seconds=TIMEOUT))

    def __str__(self):
        return f"{self.user} - {self.reason}"


    class Meta:
        app_label = "user"
        constraints = [
            models.UniqueConstraint(
                fields=["reason", "user"], name="unique_reason_for_user"
            )
        ]

    @classmethod
    def generate_otp(cls, user, reason):
        otp= cls()
        code = randrange(10 ** (cls.OTP_LENGTH - 1), (10**cls.OTP_LENGTH) - 1)
        signed_code = signing.TimestampSigner(salt=str(user.id)).sign(code)

        try:
            # if an `OTP` instance already exists for the reason and user, we reuse it.
            otp = cls.objects.get(user=user, reason=reason)
        except cls.DoesNotExist:
            # if not, we create one for the reason
            otp = cls(user=user, reason=reason)
        otp.code = signed_code[cls.OTP_LENGTH :]
        otp.save()

        return {"instance": otp, "code": code}
    
    @classmethod
    def generate_and_send_otp(cls, user, reason):
        """Generates a new OTP for user and sends to the mail attached to their account. """
        
        otp: dict= cls.generate_otp(user, reason)
        otp_instance, code= otp.values()

        serializer= NotificationSerializer(data= {
            "user": user.id,
            "notification_type": "otp",
            "mail": True,
            "is_read": True,
            "data": {
                "code": code,
                "timeout": otp_instance.TIMEOUT//60,
                "subject": "Therapease OTP"}
        })
        serializer.is_valid(raise_exception= True)
        serializer.save()


    @classmethod
    def verify_otp(cls, otp_instance, code):
        try:
            unsigned_code = int(
                signing.TimestampSigner(salt=(str(otp_instance.user.id))).unsign(
                    f"{code}{otp_instance.code}", max_age=otp_instance.timeout
                )
                )
        except (signing.BadSignature, signing.SignatureExpired, IndexError):
            return False

        return unsigned_code == int(code)