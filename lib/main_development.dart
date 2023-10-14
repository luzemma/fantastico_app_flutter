import 'package:fantastico_app/bootstrap.dart';
import 'package:fantastico_app/models/app_config.dart';
import 'package:fantastico_app/ui/app/app.dart';

void main() {
  const config = AppConfig(
    enviroment: 'DEVELOPMENT',
    appName: 'FantasticoComic_DEV',
    apiUrl: 'https://api.stg.fantasticocomic.com',
  );
  bootstrap(() => const App(), config);
}
