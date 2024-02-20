from rest_framework import serializers
from Therapeaseapi.enum import NotificationTypeEnum
from Therapeaseapi.models.notification import Notification


class NotificationSerializer(serializers.ModelSerializer):
    
    class Meta:
        model = Notification
        fields = ["id", "user","notification_type", "data", "is_read", "mail", "in_app", "created_at", "updated_at"]

    def validate_notification_type(self, value):
        if value not in NotificationTypeEnum.values:
            raise serializers.ValidationError(
                f"Invalid notification type. Valid options are: {NotificationTypeEnum.values}")
        return value