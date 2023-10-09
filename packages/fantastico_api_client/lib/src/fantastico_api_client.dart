import 'package:dio/dio.dart';
import 'package:fantastico_api_client/src/interceptors/auth_interceptor.dart';
import 'package:fantastico_api_client/src/interceptors/logging_interceptor.dart';
import 'package:fantastico_api_client/src/repositories/jwt_repository_interface.dart';

class FantasticoApiClient {
  FantasticoApiClient({
    required IJwtRepository jwtRepository,
    Dio? diocClient,
    String? baseUrl,
  })  : _dio = diocClient ?? Dio(),
        _baseUrl = baseUrl ?? _urlDev {
    _dio
      ..options.baseUrl = _baseUrl
      ..options.headers = const {'Content-Type': 'application/json'}
      ..options.connectTimeout = const Duration(seconds: 60)
      ..options.receiveTimeout = const Duration(seconds: 60)
      ..options.responseType = ResponseType.json
      ..interceptors.add(LoggingInterceptor())
      ..interceptors.add(
        AuthInterceptor(
          jwtRepository: jwtRepository,
        ),
      );
  }

  static const _urlDev = 'https://api.stg.fantasticocomic.com';

  final Dio _dio;
  final String _baseUrl;

  Future<Response> get(
    String path, {
    Map<String, dynamic>? params,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      final response = await _dio.get(
        path,
        queryParameters: params,
        options: options,
        cancelToken: cancelToken,
        onReceiveProgress: onReceiveProgress,
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<Response<dynamic>> post(
    String path, {
    dynamic data,
    Map<String, dynamic>? params,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      final response = await _dio.post(
        path,
        data: data,
        queryParameters: params,
        options: options,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<Response> put(
    String path, {
    dynamic data,
    Map<String, dynamic>? params,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      final response = await _dio.put(
        path,
        data: data,
        queryParameters: params,
        options: options,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<Response> delete(
    String path, {
    dynamic data,
    Map<String, dynamic>? params,
    Options? options,
    CancelToken? cancelToken,
  }) async {
    try {
      final response = await _dio.delete(
        path,
        data: data,
        queryParameters: params,
        options: options,
        cancelToken: cancelToken,
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }
}
