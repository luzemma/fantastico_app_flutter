// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dto_product_by_week.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DtoProductByWeek _$DtoProductByWeekFromJson(Map<String, dynamic> json) =>
    DtoProductByWeek(
      quantity: json['cantArts'] as String?,
      productId: json['artIdHash'] as String,
      productName: json['artDescripcion'] as String?,
      productLine: json['lineaDescripcion'] as String?,
      productPrice: json['precio'] as String?,
      productImage: json['imagen'] as String?,
    );

Map<String, dynamic> _$DtoProductByWeekToJson(DtoProductByWeek instance) {
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
