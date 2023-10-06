// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dto_related_product.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DtoRelatedProduct _$DtoRelatedProductFromJson(Map<String, dynamic> json) =>
    DtoRelatedProduct(
      id: json['artIdHash'] as String,
      name: json['artDescrip'] as String?,
      line: json['lineaDescrip'] as String?,
      brand: json['marcaDescrip'] as String?,
      price: json['precio'] as String?,
      offerPrice: json['precioOferta'] as String?,
      imageFileName: json['imageFilename'] as String?,
    );

Map<String, dynamic> _$DtoRelatedProductToJson(DtoRelatedProduct instance) {
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
  writeNotNull('precio', instance.price);
  writeNotNull('precioOferta', instance.offerPrice);
  writeNotNull('imageFilename', instance.imageFileName);
  return val;
}
