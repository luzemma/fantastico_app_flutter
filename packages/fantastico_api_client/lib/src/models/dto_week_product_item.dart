// ignore_for_file: sort_constructors_first
import 'package:fantastico_api_client/src/models/models.dart';
import 'package:json_annotation/json_annotation.dart';

part 'dto_week_product_item.g.dart';

@JsonSerializable()
class DtoWeekProductItem {
  DtoWeekProductItem({
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
    this.relatedProducts,
    this.availabilityDetail,
  });

  @JsonKey(name: 'artIdHash')
  final String id;
  @JsonKey(name: 'artDescripcion', includeIfNull: false)
  final String? name;
  @JsonKey(name: 'lineaDescription', includeIfNull: false)
  final String? line;
  @JsonKey(name: 'marcaDescripcion', includeIfNull: false)
  final String? brand;
  @JsonKey(name: 'sinopsis', includeIfNull: false)
  final String? synopsis;
  @JsonKey(name: 'precio', includeIfNull: false)
  final String? price;
  @JsonKey(name: 'precioOferta', includeIfNull: false)
  final String? offerPrice;
  @JsonKey(name: 'imagen', includeIfNull: false)
  final String? imageFileName;
  @JsonKey(name: 'disponibleTV', defaultValue: false)
  final bool isAvailableInVirtualShop;
  @JsonKey(name: 'inWishList', defaultValue: false)
  final bool inWishlist;
  @JsonKey(name: 'relacionados', includeIfNull: false)
  final List<DtoRelatedProduct>? relatedProducts;
  @JsonKey(name: 'detalleDisponibilidad', includeIfNull: false)
  final List<DtoAvailability>? availabilityDetail;

  factory DtoWeekProductItem.fromJson(Map<String, dynamic> json) =>
      _$DtoWeekProductItemFromJson(json);

  Map<String, dynamic> toJson() => _$DtoWeekProductItemToJson(this);
}
