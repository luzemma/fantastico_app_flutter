import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:fantastico_app/models/enums/cubit_status.dart';
import 'package:fantastico_app/models/models.dart';
import 'package:fantastico_app/repositories/jwt_repository.dart';
import 'package:fantastico_app/repositories/session_repository.dart';
import 'package:fantastico_app/utils/string_helper.dart';
import 'package:flutter/material.dart';
import 'package:package_info_plus/package_info_plus.dart';

part 'splash_state.dart';

class SplashCubit extends Cubit<SplashState> {
  SplashCubit(
      {required SessionRepository sessionRepo,
      required JwtRepository jwtRepository,
      required AppConfig appConfig})
      : _sessionRepository = sessionRepo,
        _jwtRepository = jwtRepository,
        _appConfig = appConfig,
        super(const SplashState());

  Future<void> onInitial() async {
    emit(state.copyWith(status: CubitStatus.loading));
    try {
      final packageInfo = await PackageInfo.fromPlatform();
      final version = packageInfo.version;
      final code = packageInfo.buildNumber;
      emit(
        state.copyWith(
          enviroment: _appConfig.enviroment,
          version: version,
          code: code,
        ),
      );
      await Future.delayed(const Duration(seconds: 3));
      final jwt = await _sessionRepository.getSession();
      await _jwtRepository.saveJwt(jwt);
      emit(state.copyWith(status: CubitStatus.success));
    } catch (e) {
      debugPrint(e.toString());
      emit(
        state.copyWith(status: CubitStatus.failure, error: e.toString()),
      );
    }
  }

  final SessionRepository _sessionRepository;
  final JwtRepository _jwtRepository;
  final AppConfig _appConfig;
}
