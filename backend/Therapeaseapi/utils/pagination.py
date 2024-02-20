from rest_framework.pagination import PageNumberPagination

class CustomPagination(PageNumberPagination):
    page_size = 10  
    page_size_query_param = 'page_size'
    max_page_size = 100

    def get_page_size(self, request):
        if 'all' in request.query_params:
            return None  # Returns None to indicate no pagination
        return super().get_page_size(request)