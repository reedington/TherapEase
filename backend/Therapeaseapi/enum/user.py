from django.db.models import TextChoices
from django.db import models


class GenderTypeEnum(TextChoices):
    MALE = "male"
    FEMALE = "female"
    PREFERNOT = "prefernot"

class AgeRangeEnum(models.TextChoices):
    BELOW_18 = 'Below 18', 'Below 18'
    BETWEEN_18_24 = '18-24', '18-24'
    BETWEEN_25_34 = '25-34', '25-34'
    ABOVE_35 = '35 and above', '35 and above'

