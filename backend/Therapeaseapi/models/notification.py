from django.db import models
from uuid import uuid4

class Notification(models.Model):
    id = models.UUIDField(default=uuid4, editable=False, unique=True, primary_key= True)

    user= models.ForeignKey("User", on_delete= models.CASCADE, related_name= "notifications")
    notification_type= models.CharField(max_length= 50)
    data= models.JSONField(null= True)
    is_read= models.BooleanField(default= False)
    mail= models.BooleanField(default= False)
    in_app= models.BooleanField(default= False)
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)

    def __str__(self):
        return f"{self.user}-{self.notification_type}-{self.created_at}"
    
    class Meta:
        app_label = "user"