// ignore_for_file: sort_constructors_first

import 'package:json_annotation/json_annotation.dart';

part 'dto_product_by_week.g.dart';

@JsonSerializable()
class DtoProductByWeek {
  DtoProductByWeek({
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
  @JsonKey(name: 'cantArts', defaultValue: 0)
  final int quantity;

  factory DtoProductByWeek.fromJson(Map<String, dynamic> json) =>
      _$DtoProductByWeekFromJson(json);

  Map<String, dynamic> toJson() => _$DtoProductByWeekToJson(this);
}
