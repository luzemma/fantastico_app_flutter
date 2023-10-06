import 'package:dio/dio.dart';
import 'package:logger/logger.dart';

/// LoggingInterceptor
class LoggingInterceptor extends Interceptor {
  /// LoggingInterceptor
  LoggingInterceptor() {
    _logger = Logger(
      printer: PrettyPrinter(
        methodCount: 0,
        errorMethodCount: 5,
        lineLength: 50,
        printTime: true,
      ),
    );
  }

  late Logger _logger;

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    _logger.i('REQUEST[${options.method}] => '
        'BASEURL: ${options.baseUrl} => '
        'PATH: ${options.path} => '
        'REQUEST VALUES: ${options.queryParameters} => '
        'HEADERS: ${options.headers}');
    return handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    _logger.i('RESPONSE[${response.statusCode}] => ${response.data}');
    return handler.next(response);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    _logger.i('Error[${err.response?.statusCode}]');
    return handler.next(err);
  }
}
