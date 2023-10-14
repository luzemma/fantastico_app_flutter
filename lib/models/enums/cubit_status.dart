enum CubitStatus { initial, loading, success, failure }

extension CubitStatusX on CubitStatus {
  bool get isInitial => this == CubitStatus.initial;
  bool get isLoading => this == CubitStatus.loading;
  bool get isSuccessful => this == CubitStatus.success;
  bool get hasError => this == CubitStatus.failure;
}
