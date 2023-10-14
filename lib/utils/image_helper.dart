import 'package:fantastico_app/utils/string_extension.dart';

class ImageHelper {
  static const noImagePath = 'im/0/00/libro-sin-imagen.jpg';

  static String? getProductImagePath(String? fileName) {
    if (fileName == null) return noImagePath;

    final prefix = fileName.substringHead(3);
    final suffix = fileName.substringTail(fileName.length - 3);

    return 'im/${prefix.substringHead(1)}/${prefix.substringTail(2)}/$suffix';
  }
}
