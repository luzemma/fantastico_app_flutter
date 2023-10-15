import 'package:dio/dio.dart';
import 'package:fantastico_api_client/fantastico_api_client.dart';
import 'package:fantastico_api_client/src/exceptions/custom_api_error.dart';
import 'package:fantastico_api_client/src/repositories/jwt_repository.dart';

class ProductsApi {
  ProductsApi({FantasticoApiClient? apiClient})
      : _apiClient = apiClient ??
            FantasticoApiClient(
              jwtRepository: JwtRepository(),
            );

  final FantasticoApiClient _apiClient;

  static const _endpoint = '/productos';

  Future<DtoWeek> getProductsByWeekNumber(int weekNumber) async {
    try {
      final path = '$_endpoint/semana/$weekNumber';
      final response = await _apiClient.get(
        path,
        options: Options(
          headers: {
            'requiresAuth': true,
          },
        ),
      );
      final data = response.data as Map<String, dynamic>;

      final week = DtoWeek.fromJson(data['data'] as Map<String, dynamic>);
      return week;
    } on DioException catch (e) {
      throw CustomApiError.fromDioError(e);
    }
  }
}
