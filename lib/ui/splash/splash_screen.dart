import 'package:fantastico_app/models/enums/cubit_status.dart';
import 'package:fantastico_app/repositories/jwt_repository.dart';
import 'package:fantastico_app/repositories/session_repository.dart';
import 'package:fantastico_app/services/service_locator.dart';
import 'package:fantastico_app/ui/splash/cubit/splash_cubit.dart';
import 'package:fantastico_app/utils/color_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class SplashProvider extends StatelessWidget {
  const SplashProvider({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SplashCubit(
        sessionRepo: ServiceLocator.getIt<SessionRepository>(),
        jwtRepository: ServiceLocator.getIt<JwtRepository>(),
      )..onInitial(),
      child: const SplashScreen(),
    );
  }
}

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<SplashCubit, SplashState>(
      listenWhen: (previous, current) {
        return previous.status != current.status;
      },
      listener: (context, state) {
        if (state.status.isSuccessful) {
          context.go('/home');
        }
      },
      child: ColoredBox(
        color: ColorHelper.primaryBlue,
        child: const Center(
          child: SizedBox(
            height: 200,
            width: 200,
            child: CircularProgressIndicator(
              backgroundColor: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
