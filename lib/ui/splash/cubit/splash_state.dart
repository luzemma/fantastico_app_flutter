part of 'splash_cubit.dart';

class SplashState extends Equatable {
  const SplashState({
    this.status = CubitStatus.initial,
    this.enviroment,
    this.version,
    this.code,
    this.error,
  });

  final CubitStatus status;
  final String? enviroment;
  final String? version;
  final String? code;
  final String? error;

  @override
  List<Object?> get props => [
        status,
        enviroment,
        version,
        code,
        error,
      ];

  bool get showEnviroment =>
      enviroment == StringHelper.development ||
      enviroment == StringHelper.staging;

  SplashState copyWith({
    CubitStatus? status,
    String? enviroment,
    String? version,
    String? code,
    String? error,
  }) {
    return SplashState(
      status: status ?? this.status,
      enviroment: enviroment ?? this.enviroment,
      version: version ?? this.version,
      code: code ?? this.code,
      error: error,
    );
  }
}
