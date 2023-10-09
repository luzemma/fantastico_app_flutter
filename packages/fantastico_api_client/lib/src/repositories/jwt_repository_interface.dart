abstract class IJwtRepository {
  Future<String?> get jwt;

  Future<void> saveJwt(String value);

  Future<void> deleteJwt();

  Future<bool> get hasJwt;
}
