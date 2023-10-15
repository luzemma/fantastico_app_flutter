import 'package:collection/collection.dart';
import 'package:fantastico_api_client/fantastico_api_client.dart';
import 'package:fantastico_app/models/app_config.dart';
import 'package:fantastico_app/models/helpers_to_models.dart';
import 'package:fantastico_app/models/home_week.dart';
import 'package:fantastico_app/repositories/jwt_repository.dart';

class HomeRepository {
  HomeRepository({required AppConfig appConfig, FantasticoApiClient? apiClient})
      : _appConfig = appConfig,
        _apiClient = apiClient ??
            FantasticoApiClient(
              jwtRepository: JwtRepository(),
            );

  final FantasticoApiClient _apiClient;
  final AppConfig _appConfig;

  Future<List<HomeWeek>> getWeeks() async {
    final api = HomeApi(apiClient: _apiClient);
    final data = await api.getWeeks();
    return data
        .map((e) => dtoToHomeWeek(e, _appConfig.imageBaseUrl))
        .whereNotNull()
        .toList();
  }
}
