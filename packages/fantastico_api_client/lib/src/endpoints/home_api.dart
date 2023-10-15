import 'package:dio/dio.dart';
import 'package:fantastico_api_client/fantastico_api_client.dart';
import 'package:fantastico_api_client/src/exceptions/custom_api_error.dart';
import 'package:fantastico_api_client/src/repositories/jwt_repository.dart';

class HomeApi {
  HomeApi({FantasticoApiClient? apiClient})
      : _apiClient = apiClient ??
            FantasticoApiClient(
              jwtRepository: JwtRepository(),
            );

  final FantasticoApiClient _apiClient;

  Future<List<DtoHomeWeek>> getWeeks() async {
    try {
      final response = await _apiClient.get(
        '/home',
        options: Options(
          headers: {
            'requiresAuth': true,
          },
        ),
      );
      final data = response.data as Map<String, dynamic>;
      final rawData = data['data'] as List?;

      if (rawData != null) {
        final weeks = rawData.map(
          (item) => DtoHomeWeek.fromJson(item as Map<String, dynamic>),
        );
        return weeks.toList();
      } else {
        return List.empty();
      }
    } on DioException catch (e) {
      throw CustomApiError.fromDioError(e);
    }
  }
}
