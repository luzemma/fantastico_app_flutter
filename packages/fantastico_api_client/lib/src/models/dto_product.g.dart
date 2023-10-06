// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dto_product.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DtoProduct _$DtoProductFromJson(Map<String, dynamic> json) => DtoProduct(
      id: json['artIdHash'] as String,
      isAvailableInVirtualShop: json['disponibleTV'] as bool? ?? false,
      inWishlist: json['inWishlist'] as bool? ?? false,
      name: json['artDescripcion'] as String?,
      line: json['lineaDescrip'] as String?,
      brand: json['marcaDescrip'] as String?,
      synopsis: json['sinopsis'] as String?,
      price: json['precio'] as String?,
      offerPrice: json['precioOferta'] as String?,
      relatedComics: (json['relacionados'] as List<dynamic>?)
          ?.map((e) => DtoRelatedProduct.fromJson(e as Map<String, dynamic>))
          .toList(),
      availabilityDetail: (json['detalleDisponibilidad'] as List<dynamic>?)
          ?.map((e) => DtoAvailability.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$DtoProductToJson(DtoProduct instance) {
  final val = <String, dynamic>{
    'artIdHash': instance.id,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('artDescripcion', instance.name);
  writeNotNull('lineaDescrip', instance.line);
  writeNotNull('marcaDescrip', instance.brand);
  writeNotNull('sinopsis', instance.synopsis);
  writeNotNull('precio', instance.price);
  writeNotNull('precioOferta', instance.offerPrice);
  val['disponibleTV'] = instance.isAvailableInVirtualShop;
  val['inWishlist'] = instance.inWishlist;
  writeNotNull('relacionados', instance.relatedComics);
  writeNotNull('detalleDisponibilidad', instance.availabilityDetail);
  return val;
}
