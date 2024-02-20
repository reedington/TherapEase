from django.contrib.auth.models import AbstractUser, BaseUserManager
from django.db import models



import datetime
import uuid
from django.contrib.postgres.fields import ArrayField
from Therapeaseapi.enum import GenderTypeEnum, AgeRangeEnum



class CustomUserManager(BaseUserManager):
	def create_user(self, email, password=None, **extra_fields):
		"""
		Creates and saves a User with the given email and password.
		"""
		if not email:
			raise ValueError("The Email field must be set")
		email = self.normalize_email(email)
		user = self.model(email=email, **extra_fields)
		user.set_password(password)
		user.save(using=self._db)
		return user

	def create_superuser(self, email=None, password=None, **extra_fields):
		extra_fields.setdefault("is_staff", True)
		extra_fields.setdefault("is_superuser", True)

		if extra_fields.get("is_staff") is not True:
			raise ValueError("Superuser must have is_staff=True.")
		if extra_fields.get("is_superuser") is not True:
			raise ValueError("Superuser must have is_superuser=True.")

		return self.create_user(email, password, **extra_fields)

null_blank = {"null": True, "blank": True} 


class User(AbstractUser):
	

	id = models.UUIDField(default=uuid.uuid4, editable=False, unique=True, primary_key= True)
	username = models.CharField(max_length=255, **null_blank) 
	first_name = models.CharField(max_length= 255, **null_blank)
	last_name = models.CharField(max_length= 255, **null_blank)
	email = models.EmailField(unique=True)
	gender = models.CharField(max_length=20, choices=GenderTypeEnum.choices, default = GenderTypeEnum.PREFERNOT)
	avatar = models.URLField(**null_blank)
	age = models.CharField(
        max_length=15,
        choices=AgeRangeEnum.choices,
        default=AgeRangeEnum.BELOW_18,
    )
	struggle = ArrayField(
        models.CharField(max_length=255),
        **null_blank, default=list
    )
	created_at= models.DateTimeField(auto_now_add=True)
	updated_at= models.DateTimeField(auto_now=True)
	is_active = models.BooleanField(default=False)
	is_staff = models.BooleanField(default=False)
	is_superuser = models.BooleanField(default=False)



	objects = CustomUserManager()

	USERNAME_FIELD = "email"
	REQUIRED_FIELDS = ["first_name", "last_name", "gender",]


	def __str__(self):
		return f"{self.first_name}-{self.email}"