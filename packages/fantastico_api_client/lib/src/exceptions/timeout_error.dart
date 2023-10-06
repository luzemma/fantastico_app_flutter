class TimeoutError implements Exception {
  TimeoutError(this.message);

  final String message;

  @override
  String toString() => message;
}
