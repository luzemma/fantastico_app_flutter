// ignore_for_file: sort_constructors_first

import 'package:json_annotation/json_annotation.dart';

part 'dto_related_product.g.dart';

@JsonSerializable()
class DtoRelatedProduct {
  DtoRelatedProduct({
    required this.id,
    this.name,
    this.line,
    this.brand,
    this.price,
    this.offerPrice,
    this.imageFileName,
  });

  @JsonKey(name: 'artIdHash')
  final String id;
  @JsonKey(name: 'artDescrip', includeIfNull: false)
  final String? name;
  @JsonKey(name: 'lineaDescrip', includeIfNull: false)
  final String? line;
  @JsonKey(name: 'marcaDescrip', includeIfNull: false)
  final String? brand;
  @JsonKey(name: 'precio', includeIfNull: false)
  final String? price;
  @JsonKey(name: 'precioOferta', includeIfNull: false)
  final String? offerPrice;
  @JsonKey(name: 'imageFilename', includeIfNull: false)
  final String? imageFileName;

  factory DtoRelatedProduct.fromJson(Map<String, dynamic> json) =>
      _$DtoRelatedProductFromJson(json);

  Map<String, dynamic> toJson() => _$DtoRelatedProductToJson(this);
}
