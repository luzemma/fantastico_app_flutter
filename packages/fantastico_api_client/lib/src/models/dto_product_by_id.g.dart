// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dto_product_by_id.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DtoProductById _$DtoProductByIdFromJson(Map<String, dynamic> json) =>
    DtoProductById(
      id: json['artIdHash'] as String,
      isAvailableInVirtualShop: json['disponibleTV'] as bool? ?? false,
      inWishlist: json['inWishlist'] as bool? ?? false,
      name: json['artDescrip'] as String?,
      line: json['lineaDescrip'] as String?,
      brand: json['marcaDescrip'] as String?,
      synopsis: json['sinopsis'] as String?,
      price: json['precio'] as String?,
      offerPrice: json['precioOferta'] as String?,
      imageFileName: json['imageFilename'] as String?,
      relatedProducts: (json['relacionados'] as List<dynamic>?)
          ?.map((e) => DtoRelatedProduct.fromJson(e as Map<String, dynamic>))
          .toList(),
      availabilityDetail: (json['detalleDisponibilidad'] as List<dynamic>?)
          ?.map((e) => DtoAvailability.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$DtoProductByIdToJson(DtoProductById instance) {
  final val = <String, dynamic>{
    'artIdHash': instance.id,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('artDescrip', instance.name);
  writeNotNull('lineaDescrip', instance.line);
  writeNotNull('marcaDescrip', instance.brand);
  writeNotNull('sinopsis', instance.synopsis);
  writeNotNull('precio', instance.price);
  writeNotNull('precioOferta', instance.offerPrice);
  writeNotNull('imageFilename', instance.imageFileName);
  val['disponibleTV'] = instance.isAvailableInVirtualShop;
  val['inWishlist'] = instance.inWishlist;
  writeNotNull('relacionados', instance.relatedProducts);
  writeNotNull('detalleDisponibilidad', instance.availabilityDetail);
  return val;
}
