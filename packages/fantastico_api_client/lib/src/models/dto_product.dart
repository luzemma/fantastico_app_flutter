// ignore_for_file: sort_constructors_first
import 'package:fantastico_api_client/src/models/models.dart';
import 'package:json_annotation/json_annotation.dart';

part 'dto_product.g.dart';

@JsonSerializable()
class DtoProduct {
  DtoProduct({
    required this.id,
    required this.isAvailableInVirtualShop,
    required this.inWishlist,
    this.name,
    this.line,
    this.brand,
    this.synopsis,
    this.price,
    this.offerPrice,
    this.relatedComics,
    this.availabilityDetail,
  });

  @JsonKey(name: 'artIdHash')
  final String id;
  @JsonKey(name: 'artDescripcion', includeIfNull: false)
  final String? name;
  @JsonKey(name: 'lineaDescrip', includeIfNull: false)
  final String? line;
  @JsonKey(name: 'marcaDescrip', includeIfNull: false)
  final String? brand;
  @JsonKey(name: 'sinopsis', includeIfNull: false)
  final String? synopsis;
  @JsonKey(name: 'precio', includeIfNull: false)
  final String? price;
  @JsonKey(name: 'precioOferta', includeIfNull: false)
  final String? offerPrice;
  @JsonKey(name: 'disponibleTV', defaultValue: false)
  final bool isAvailableInVirtualShop;
  @JsonKey(name: 'inWishlist', defaultValue: false)
  final bool inWishlist;
  @JsonKey(name: 'relacionados', includeIfNull: false)
  final List<DtoRelatedProduct>? relatedComics;
  @JsonKey(name: 'detalleDisponibilidad', includeIfNull: false)
  final List<DtoAvailability>? availabilityDetail;

  factory DtoProduct.fromJson(Map<String, dynamic> json) =>
      _$DtoProductFromJson(json);

  Map<String, dynamic> toJson() => _$DtoProductToJson(this);
}
