import 'package:dio/dio.dart';

class ApiClient {
  final Dio dio;

  ApiClient({
    required String baseUrl,
    required String apiKey,
  }) : dio = Dio(BaseOptions(baseUrl: baseUrl)) {
    dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) {
        options.queryParameters['appid'] = apiKey;
        handler.next(options);
      },
      onError: (DioException error, handler) {
        handler.next(error);
      },
    ));
  }

  Future<Response> get(
    String path, {
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      final response = await dio.get(
        path,
        queryParameters: queryParameters,
      );
      return response;
    } catch (error) {
      rethrow;
    }
  }
}
