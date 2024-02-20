from django.db.models import TextChoices

class NotificationTypeEnum(TextChoices):
    INVOICE_OPENED= "invoice_opened"
    CREATE_TRIAL_BALANCE= "create_trial_balance"
    OTP= "otp"
    TRANSACTIONS_SPOOLED= "transactions_spooled"
