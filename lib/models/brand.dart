import 'package:fantastico_app/utils/assets_helper.dart';

class Brand {
  Brand({
    required this.id,
    required this.name,
    required this.imageFile,
  });

  final int id;
  final String name;
  final String imageFile;
}

final brands = [
  Brand(id: 1937, name: 'Tokyopop', imageFile: AssetHelper.brandTokyopop),
  Brand(id: 2305, name: 'Dark Horse', imageFile: AssetHelper.brandDarkHorse),
  Brand(id: 2315, name: 'DC', imageFile: AssetHelper.brandDC),
  Brand(id: 2309, name: 'Marvel', imageFile: AssetHelper.brandMarvel),
  Brand(
    id: 2304,
    name: 'Image Comics',
    imageFile: AssetHelper.brandImageComics,
  ),
  Brand(
    id: 2342,
    name: 'Archie Comics',
    imageFile: AssetHelper.brandArchieComics,
  ),
];
