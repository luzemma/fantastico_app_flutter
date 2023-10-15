// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dto_week.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DtoWeek _$DtoWeekFromJson(Map<String, dynamic> json) => DtoWeek(
      products:
          DtoWeekProduct.fromJson(json['productos'] as Map<String, dynamic>),
      quantity: json['cantProductos'] as int,
    );

Map<String, dynamic> _$DtoWeekToJson(DtoWeek instance) => <String, dynamic>{
      'productos': instance.products,
      'cantProductos': instance.quantity,
    };
