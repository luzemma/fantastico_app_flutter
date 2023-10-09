import 'package:dio/dio.dart';
import 'package:fantastico_api_client/src/repositories/jwt_repository_interface.dart';

class AuthInterceptor extends Interceptor {
  AuthInterceptor({required IJwtRepository jwtRepository})
      : _jwtRepository = jwtRepository;

  final IJwtRepository _jwtRepository;

  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    if (options.headers.containsKey('requiresAuth')) {
      options.headers.remove('requiresAuth');
      final token = await _jwtRepository.jwt;
      if (token != null && token != '') {
        options.headers['x-jwt-token'] = token;
      }
    }
    return handler.next(options);
  }
}
