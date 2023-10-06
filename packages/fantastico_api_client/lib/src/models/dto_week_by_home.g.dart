// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dto_week_by_home.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DtoWeekByHome _$DtoWeekByHomeFromJson(Map<String, dynamic> json) =>
    DtoWeekByHome(
      weekNumber: json['semanaNum'] as int,
      weekDescription: json['semanaDescripcion'] as String,
      weekProducts: (json['semana'] as List<dynamic>?)
          ?.map((e) => DtoProductByWeek.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$DtoWeekByHomeToJson(DtoWeekByHome instance) {
  final val = <String, dynamic>{
    'semanaNum': instance.weekNumber,
    'semanaDescripcion': instance.weekDescription,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('semana', instance.weekProducts);
  return val;
}
