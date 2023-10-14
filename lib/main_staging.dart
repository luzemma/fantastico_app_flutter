import 'package:fantastico_app/bootstrap.dart';
import 'package:fantastico_app/models/app_config.dart';
import 'package:fantastico_app/ui/app/app.dart';

void main() {
  const config = AppConfig(
    enviroment: 'STAGING',
    appName: 'FantasticoComic_QA',
    apiUrl: 'https://api.stg.fantasticocomic.com',
  );
  bootstrap(() => const App(), config);
}
