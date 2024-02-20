from rest_framework.response import Response



class BaseResponse:
    """base response for all api endpoints"""
    def success(self, data=None, message=None, status_code=200):
        response_data = {"status": "success", "message": message, "status_code":status_code, "data": data}
        return response_data

    def error(self, message, status_code=400):
        response_data = {"status": "error","status_code":status_code, "message": message}
        return response_data
    
response = BaseResponse()