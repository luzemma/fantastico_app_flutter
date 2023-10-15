// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dto_home_week_product.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DtoHomeWeekProduct _$DtoHomeWeekProductFromJson(Map<String, dynamic> json) =>
    DtoHomeWeekProduct(
      quantity: json['cantArts'] as String?,
      productId: json['artIdHash'] as String,
      productName: json['artDescripcion'] as String?,
      productLine: json['lineaDescripcion'] as String?,
      productPrice: json['precio'] as String?,
      productImage: json['imagen'] as String?,
    );

Map<String, dynamic> _$DtoHomeWeekProductToJson(DtoHomeWeekProduct instance) {
  final val = <String, dynamic>{
    'artIdHash': instance.productId,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('artDescripcion', instance.productName);
  writeNotNull('lineaDescripcion', instance.productLine);
  writeNotNull('precio', instance.productPrice);
  writeNotNull('imagen', instance.productImage);
  writeNotNull('cantArts', instance.quantity);
  return val;
}
