class RequestCancelledError implements Exception {
  static const _message = 'Request to API server was cancelled';

  @override
  String toString() => _message;
}
