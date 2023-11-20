import 'package:fantastico_app/models/enums/cubit_status.dart';
import 'package:fantastico_app/models/models.dart';
import 'package:fantastico_app/repositories/jwt_repository.dart';
import 'package:fantastico_app/repositories/session_repository.dart';
import 'package:fantastico_app/services/service_locator.dart';
import 'package:fantastico_app/ui/app/widgets/spinner_loader.dart';
import 'package:fantastico_app/ui/splash/cubit/splash_cubit.dart';
import 'package:fantastico_app/utils/assets_helper.dart';
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
        appConfig: ServiceLocator.getIt<AppConfig>(),
      )..onInitial(),
      child: const SplashScreen(),
    );
  }
}

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return BlocConsumer<SplashCubit, SplashState>(
      listenWhen: (previous, current) {
        return previous.status != current.status;
      },
      listener: (context, state) {
        if (state.status.isSuccessful) {
          context.go('/home');
        }
      },
      builder: (context, state) {
        return ColoredBox(
          color: ColorHelper.primaryBlue,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  AssetHelper.logoFantastico,
                  height: 100,
                ),
                const SizedBox(
                  height: 16,
                ),
                Image.asset(
                  AssetHelper.logoComicCastle,
                  height: 100,
                ),
                const SizedBox(
                  height: 16,
                ),
                const SpinnerLoader(
                  width: 50,
                  height: 50,
                  color: Colors.white,
                ),
                const SizedBox(
                  height: 32,
                ),
                Visibility(
                  visible: state.showEnviroment,
                  child: Text(
                    state.enviroment ?? '',
                    style: textTheme.headlineMedium?.copyWith(
                      color: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                if (state.version != null) ...[
                  Text(
                    'Version ${state.version}',
                    style: textTheme.headlineLarge?.copyWith(
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                ],
                if (state.code != null) ...[
                  Text(
                    'Code ${state.code}',
                    style: textTheme.headlineMedium?.copyWith(
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                ],
              ],
            ),
          ),
        );
      },
    );
  }
}
