// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dto_week_product_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DtoWeekProductItem _$DtoWeekProductItemFromJson(Map<String, dynamic> json) =>
    DtoWeekProductItem(
      id: json['artIdHash'] as String,
      isAvailableInVirtualShop: json['disponibleTV'] as bool? ?? false,
      inWishlist: json['inWishList'] as bool? ?? false,
      name: json['artDescripcion'] as String?,
      line: json['lineaDescription'] as String?,
      brand: json['marcaDescripcion'] as String?,
      synopsis: json['sinopsis'] as String?,
      price: json['precio'] as String?,
      offerPrice: json['precioOferta'] as String?,
      imageFileName: json['imagen'] as String?,
      availabilityDetail: (json['detalleDisponibilidad'] as List<dynamic>?)
          ?.map((e) => DtoAvailability.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$DtoWeekProductItemToJson(DtoWeekProductItem instance) {
  final val = <String, dynamic>{
    'artIdHash': instance.id,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('artDescripcion', instance.name);
  writeNotNull('lineaDescription', instance.line);
  writeNotNull('marcaDescripcion', instance.brand);
  writeNotNull('sinopsis', instance.synopsis);
  writeNotNull('precio', instance.price);
  writeNotNull('precioOferta', instance.offerPrice);
  writeNotNull('imagen', instance.imageFileName);
  val['disponibleTV'] = instance.isAvailableInVirtualShop;
  val['inWishList'] = instance.inWishlist;
  writeNotNull('detalleDisponibilidad', instance.availabilityDetail);
  return val;
}
