import 'package:fantastico_api_client/fantastico_api_client.dart';
import 'package:fantastico_app/models/app_config.dart';
import 'package:fantastico_app/repositories/home_repository.dart';
import 'package:fantastico_app/repositories/jwt_repository.dart';
import 'package:fantastico_app/repositories/product_repository.dart';
import 'package:fantastico_app/repositories/session_repository.dart';
import 'package:get_it/get_it.dart';

class ServiceLocator {
  const ServiceLocator._();

  static final getIt = GetIt.instance;

  static void setupServiceLocator(AppConfig appConfig) {
    getIt
      ..registerSingleton(appConfig)
      // Jwt Repository repositories
      ..registerSingleton(JwtRepository())
      // API Client
      ..registerSingleton(
        FantasticoApiClient(
          baseUrl: appConfig.apiUrl,
          jwtRepository: getIt<JwtRepository>(),
        ),
      ) // Remote repositories
      ..registerLazySingleton(
        () => SessionRepository(
          apiClient: getIt<FantasticoApiClient>(),
          jwtRepository: getIt<JwtRepository>(),
        ),
      )
      ..registerLazySingleton(
        () => HomeRepository(
          apiClient: getIt<FantasticoApiClient>(),
          appConfig: getIt<AppConfig>(),
        ),
      )
      ..registerLazySingleton(
        () => ProductRepository(
          apiClient: getIt<FantasticoApiClient>(),
          appConfig: getIt<AppConfig>(),
        ),
      );
  }
}
