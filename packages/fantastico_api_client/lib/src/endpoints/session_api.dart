import 'package:dio/dio.dart';
import 'package:fantastico_api_client/fantastico_api_client.dart';
import 'package:fantastico_api_client/src/exceptions/custom_api_error.dart';
import 'package:fantastico_api_client/src/repositories/jwt_repository.dart';

class SessionApi {
  SessionApi({FantasticoApiClient? apiClient})
      : _apiClient = apiClient ??
            FantasticoApiClient(
              jwtRepository: JwtRepository(),
            );

  final FantasticoApiClient _apiClient;

  Future<String> getSession() async {
    try {
      final response = await _apiClient.get(
        '/session',
        options: Options(
          headers: {
            'requiresAuth': true,
          },
        ),
      );
      final data = (response.data as Map<String, dynamic>)['data']
          as Map<String, dynamic>?;
      if (data != null) {
        final session = data['session'] as Map<String, dynamic>;
        return session['jwt'] as String;
      } else {
        throw UnknownError('jwt is null');
      }
    } on DioException catch (e) {
      throw CustomApiError.fromDioError(e);
    } catch (e) {
      rethrow;
    }
  }
}
