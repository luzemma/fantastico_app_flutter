// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dto_availability.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DtoAvailability _$DtoAvailabilityFromJson(Map<String, dynamic> json) =>
    DtoAvailability(
      detail: json['disponibilidad'] as String?,
      shop: json['lugarDescrip'] as String?,
    );

Map<String, dynamic> _$DtoAvailabilityToJson(DtoAvailability instance) {
  final val = <String, dynamic>{
    'disponibilidad': instance.detail,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('lugarDescrip', instance.shop);
  return val;
}
