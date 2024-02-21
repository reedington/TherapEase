import 'package:therapease/utils/utils.dart';

abstract class NetworkService {
  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: AppConstant.baseUrl,
      sendTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 10),
    ),
  );

  NetworkService() {
    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          var token = LocalStorage.instance.getToken();
          if (token != null) {}
          options.headers[HttpHeaders.acceptHeader] = ' application/json';
          return handler.next(options);
        },
        onResponse: (response, handler) {
          return handler.next(response);
        },
        onError: (DioException e, handler) async {
          if (e.response?.statusCode == 401) {
            try {
              // Refresh token
              var response = await _dio.request(
                e.requestOptions.path,
                data: e.requestOptions.data,
                queryParameters: e.requestOptions.queryParameters,
                options: Options(
                  method: e.requestOptions.method,
                  headers: e.requestOptions.headers,
                ),
              );
              return handler.resolve(response);
            } catch (_) {
              // Logout
            }
          }
          return handler.next(e);
        },
      ),
    );
  }

  Future<Response> getRequestHandler(
    String path, {
    Options? options,
    Map<String, dynamic>? data,
    Map<String, dynamic>? queryPatameters,
    bool useBaseUrl = true,
    CancelToken? cancelToken,
  }) async {
    String uri = '${AppConstant.baseUrl}/$path/';
    if (!useBaseUrl) {
      uri = path;
    }
    final a = await _dio.get(
      uri,
      options: options,
      queryParameters: queryPatameters,
      data: data,
      cancelToken: cancelToken,
    );
    debugPrint(a.data.toString());
    return a;
  }

  Future<Response> postRequestHandler(
    String path, {
    Object? data,
    Options? options,
    bool? deviceToken,
    bool useBaseUrl = true,
    CancelToken? cancelToken,
  }) async {
    Uri uri = Uri.parse('${AppConstant.baseUrl}/$path/');
    if (!useBaseUrl) {
      uri = Uri.parse(path);
    }
    final a = await _dio.postUri(
      uri,
      data: data,
      options: options,
      cancelToken: cancelToken,
    );
    debugPrint(a.data.toString());
    return a;
  }

  Future<Response> patchRequestHandler(
    String path, {
    Map<String, dynamic>? data,
    Options? options,
    bool useBaseUrl = true,
    CancelToken? cancelToken,
  }) async {
    Uri uri = Uri.parse('${AppConstant.baseUrl}/$path/');
    if (!useBaseUrl) {
      uri = Uri.parse(path);
    }
    final a = await _dio.patchUri(
      uri,
      cancelToken: cancelToken,
      data: data,
      options: options,
    );
    debugPrint(a.data.toString());
    return a;
  }
}
