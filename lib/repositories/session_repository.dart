import 'package:fantastico_api_client/fantastico_api_client.dart';
import 'package:fantastico_app/repositories/jwt_repository.dart';

class SessionRepository {
  SessionRepository({
    required JwtRepository jwtRepository,
    FantasticoApiClient? apiClient,
  }) : _apiClient = apiClient ??
            FantasticoApiClient(
              jwtRepository: jwtRepository,
            );

  final FantasticoApiClient _apiClient;

  Future<String> getSession() async {
    final api = SessionApi(apiClient: _apiClient);
    final jwt = await api.getSession();
    return jwt;
  }
}
