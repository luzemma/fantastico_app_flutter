part of 'search_cubit.dart';

class SearchState extends Equatable {
  const SearchState({
    this.status = CubitStatus.initial,
    this.data,
    this.error,
  });

  final CubitStatus status;
  final Week? data;
  final String? error;

  @override
  List<Object?> get props => [
        status,
        data,
        error,
      ];

  SearchState copyWith({
    CubitStatus? status,
    Week? data,
    String? error,
  }) {
    return SearchState(
      status: status ?? this.status,
      data: data ?? this.data,
      error: error,
    );
  }
}
