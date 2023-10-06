class ConnectionError implements Exception {
  static const _message = 'No Internet connection';

  @override
  String toString() => _message;
}
