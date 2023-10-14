import 'package:fantastico_api_client/fantastico_api_client.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class JwtRepository implements IJwtRepository {
  static const _keyJwt = 'Z20bE6vzStUAH0sSoD9SAwlENgrBqv';

  final _storage = const FlutterSecureStorage();

  @override
  Future<void> deleteJwt() async {
    await _storage.delete(key: _keyJwt);
  }

  @override
  Future<bool> get hasJwt async {
    final value = await _storage.read(key: _keyJwt);
    return value != null;
  }

  @override
  Future<String?> get jwt async {
    final value = await _storage.read(key: _keyJwt);
    return value;
  }

  @override
  Future<void> saveJwt(String value) async {
    await _storage.write(key: _keyJwt, value: value);
  }
}
