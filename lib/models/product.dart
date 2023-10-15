import 'package:fantastico_app/models/models.dart';

class Product {
  Product({
    required this.id,
    required this.isAvailableInVirtualShop,
    required this.inWishlist,
    this.name,
    this.line,
    this.brand,
    this.synopsis,
    this.price,
    this.offerPrice,
    this.imageFileName,
    this.relatedComics,
    this.availabilityDetail,
  });

  final String id;
  final String? name;
  final String? line;
  final String? brand;
  final String? synopsis;
  final String? price;
  final String? offerPrice;
  final String? imageFileName;
  final bool isAvailableInVirtualShop;
  final bool inWishlist;
  final List<RelatedProduct>? relatedComics;
  final List<Availability>? availabilityDetail;
}
