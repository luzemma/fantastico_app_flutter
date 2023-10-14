class AppConfig {
  const AppConfig({
    String? enviroment,
    String? appName,
    String? apiUrl,
    String? imageBaseUrl,
  })  : _enviroment = enviroment,
        _appName = appName,
        _apiUrl = apiUrl,
        _imageBaseUrl = imageBaseUrl;

  final String? _enviroment;
  final String? _appName;
  final String? _apiUrl;
  final String? _imageBaseUrl;

  String get enviroment => _enviroment ?? 'DEVELOPMENT';

  String get appName => _appName ?? 'FantasticoComic_DEV';

  String get apiUrl => _apiUrl ?? 'https://api.stg.fantasticocomic.com';

  String get imageBaseUrl => _imageBaseUrl ?? 'https://im.fantasticocomic.com';
}
