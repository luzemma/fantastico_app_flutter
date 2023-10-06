class BadResponseError implements Exception {
  BadResponseError(this.statusCode, this.data) {
    message = _handleResponseError(statusCode, data);
  }

  final int? statusCode;
  final dynamic data;
  late String message;

  String _handleResponseError(int? statusCode, dynamic data) {
    switch (statusCode) {
      case 400:
        return _evaluateErrorData(data);
      case 401:
        return 'Unauthorized';
      case 403:
        return 'Forbidden';
      case 404:
        return 'Resource Not Found';
      case 500:
        return 'Internal server error';
      case 502:
        return 'Bad gateway';
      default:
        return 'Opss! something went wrong';
    }
  }

  String _evaluateErrorData(dynamic error) {
    final err1 = error as Map<String, dynamic>?;
    final message = err1?['error'] as String?;

    return (message != null) ? message : 'Opss! something went wrong';
  }

  @override
  String toString() => message;
}
