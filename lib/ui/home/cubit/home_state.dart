part of 'home_cubit.dart';

class HomeState extends Equatable {
  const HomeState({
    this.status = CubitStatus.initial,
    this.weeks,
    this.error,
  });

  final CubitStatus status;
  final List<WeekByHome>? weeks;
  final String? error;

  @override
  List<Object?> get props => [
        status,
        weeks,
      ];

  HomeState copyWith({
    CubitStatus? status,
    List<WeekByHome>? weeks,
    String? error,
  }) {
    return HomeState(
      status: status ?? this.status,
      weeks: weeks ?? this.weeks,
      error: error ?? this.error,
    );
  }
}