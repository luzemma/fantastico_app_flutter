class BadCertificateError implements Exception {
  static const _message = 'Bad Certificate';

  @override
  String toString() => _message;
}
