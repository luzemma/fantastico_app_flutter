// ignore_for_file: sort_constructors_first

import 'package:fantastico_api_client/src/models/models.dart';
import 'package:json_annotation/json_annotation.dart';

part 'dto_home_week.g.dart';

@JsonSerializable()
class DtoHomeWeek {
  DtoHomeWeek({
    required this.weekNumber,
    required this.weekDescription,
    this.weekProducts,
  });

  @JsonKey(name: 'semanaNum')
  final String weekNumber;
  @JsonKey(name: 'semanaDescripcion')
  final String weekDescription;
  @JsonKey(name: 'semana', includeIfNull: false)
  final List<DtoHomeWeekProduct>? weekProducts;

  factory DtoHomeWeek.fromJson(Map<String, dynamic> json) =>
      _$DtoHomeWeekFromJson(json);

  Map<String, dynamic> toJson() => _$DtoHomeWeekToJson(this);
}
