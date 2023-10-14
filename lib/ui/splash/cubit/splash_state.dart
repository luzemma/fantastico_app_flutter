part of 'splash_cubit.dart';

class SplashState extends Equatable {
  const SplashState({
    this.status = CubitStatus.initial,
    this.error,
  });

  final CubitStatus status;
  final String? error;

  @override
  List<Object?> get props => [
        status,
        error,
      ];

  SplashState copyWith({
    CubitStatus? status,
    String? error,
  }) {
    return SplashState(
      status: status ?? this.status,
      error: error,
    );
  }
}
