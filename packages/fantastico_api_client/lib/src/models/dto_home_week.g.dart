// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dto_home_week.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DtoHomeWeek _$DtoHomeWeekFromJson(Map<String, dynamic> json) => DtoHomeWeek(
      weekNumber: json['semanaNum'] as String,
      weekDescription: json['semanaDescripcion'] as String,
      weekProducts: (json['semana'] as List<dynamic>?)
          ?.map((e) => DtoHomeWeekProduct.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$DtoHomeWeekToJson(DtoHomeWeek instance) {
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
