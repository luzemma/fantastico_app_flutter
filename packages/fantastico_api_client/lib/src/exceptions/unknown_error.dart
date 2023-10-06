class UnknownError implements Exception {
  UnknownError(this.message);

  final String? message;

  @override
  String toString() => 'Unexpected error occurred ${message ?? ''}'.trim();
}
