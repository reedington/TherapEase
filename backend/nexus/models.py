from django.db import models
from datetime import datetime
from django.contrib.auth import get_user_model

User = get_user_model()

# Create your models here.
class Nexus(models.Model):
    name = models.CharField(max_length=255)
    description = models.TextField()
    record = models.BooleanField(default=False)
    scheduled_time = models.DateTimeField(default=datetime.now)
    hosts = models.ManyToManyField(User, related_name='hosts')
    