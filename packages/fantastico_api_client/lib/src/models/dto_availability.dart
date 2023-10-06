// ignore_for_file: sort_constructors_first

import 'package:json_annotation/json_annotation.dart';

part 'dto_availability.g.dart';

@JsonSerializable()
class DtoAvailability {
  DtoAvailability({
    this.detail,
    this.shop,
  });

  @JsonKey(name: 'disponibilidad')
  final String? detail;
  @JsonKey(name: 'lugarDescrip', includeIfNull: false)
  final String? shop;

  factory DtoAvailability.fromJson(Map<String, dynamic> json) =>
      _$DtoAvailabilityFromJson(json);

  Map<String, dynamic> toJson() => _$DtoAvailabilityToJson(this);
}
