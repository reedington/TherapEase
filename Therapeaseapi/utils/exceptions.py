from rest_framework.exceptions import APIException
from rest_framework import status


class InvalidOTP(APIException):
    """
    A custom exception wrapper over the 422 status code
    """
    status_code = status.HTTP_422_UNPROCESSABLE_ENTITY
    default_detail = (
        "This OTP is either: invalid, already used or already expired."
    )
    default_code = "wrong_otp"