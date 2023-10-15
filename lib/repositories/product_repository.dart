import 'package:fantastico_api_client/fantastico_api_client.dart';
import 'package:fantastico_app/models/app_config.dart';
import 'package:fantastico_app/models/helpers_to_models.dart';
import 'package:fantastico_app/models/week.dart';
import 'package:fantastico_app/repositories/jwt_repository.dart';

class ProductRepository {
  ProductRepository({
    required AppConfig appConfig,
    FantasticoApiClient? apiClient,
  })  : _appConfig = appConfig,
        _apiClient = apiClient ??
            FantasticoApiClient(
              jwtRepository: JwtRepository(),
            );

  final FantasticoApiClient _apiClient;
  final AppConfig _appConfig;

  Future<Week> getProductsByWeekNumber(int weekNumber) async {
    final api = ProductApi(apiClient: _apiClient);
    final data = await api.getProductsByWeekNumber(weekNumber);

    return dtoToWeek(data, _appConfig.imageBaseUrl);
  }
}