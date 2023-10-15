// ignore_for_file: sort_constructors_first

import 'package:json_annotation/json_annotation.dart';

part 'dto_home_week_product.g.dart';

@JsonSerializable()
class DtoHomeWeekProduct {
  DtoHomeWeekProduct({
    required this.quantity,
    required this.productId,
    this.productName,
    this.productLine,
    this.productPrice,
    this.productImage,
  });

  @JsonKey(name: 'artIdHash')
  final String productId;
  @JsonKey(name: 'artDescripcion', includeIfNull: false)
  final String? productName;
  @JsonKey(name: 'lineaDescripcion', includeIfNull: false)
  final String? productLine;
  @JsonKey(name: 'precio', includeIfNull: false)
  final String? productPrice;
  @JsonKey(name: 'imagen', includeIfNull: false)
  final String? productImage;
  @JsonKey(name: 'cantArts', includeIfNull: false)
  final String? quantity;

  factory DtoHomeWeekProduct.fromJson(Map<String, dynamic> json) =>
      _$DtoHomeWeekProductFromJson(json);

  Map<String, dynamic> toJson() => _$DtoHomeWeekProductToJson(this);
}
