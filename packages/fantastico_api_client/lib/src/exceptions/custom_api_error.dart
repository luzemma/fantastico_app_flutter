import 'package:dio/dio.dart';
import 'package:fantastico_api_client/src/exceptions/exceptions.dart';

class CustomApiError {
  static Exception fromDioError(DioException error) {
    switch (error.type) {
      case DioExceptionType.cancel:
        return RequestCancelledError();
      case DioExceptionType.connectionTimeout:
        return TimeoutError('Connection timeout with API server');
      case DioExceptionType.receiveTimeout:
        return TimeoutError('Receive timeout in connection with API server');
      case DioExceptionType.badResponse:
        return BadResponseError(
          error.response?.statusCode,
          error.response?.data,
        );
      case DioExceptionType.sendTimeout:
        return TimeoutError('Send timeout in connection with API server');
      case DioExceptionType.badCertificate:
        return BadCertificateError();
      case DioExceptionType.connectionError:
        return ConnectionError();
      case DioExceptionType.unknown:
        if (error.message != null &&
            error.message!.contains('SocketException')) {
          return ConnectionError();
        }

        return UnknownError(error.message);
    }
  }
}
