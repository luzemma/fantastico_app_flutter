import 'dart:convert';

class RelatedProduct {
  RelatedProduct({
    required this.id,
    this.name,
    this.line,
    this.brand,
    this.price,
    this.offerPrice,
    this.imageFileName,
  });

  final String id;
  final String? name;
  final String? line;
  final String? brand;
  final String? price;
  final String? offerPrice;
  final String? imageFileName;

  String get hashedId => base64.encode(id.codeUnits);
}
