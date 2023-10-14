// ignore_for_file: sort_constructors_first

import 'package:fantastico_api_client/src/models/models.dart';
import 'package:json_annotation/json_annotation.dart';

part 'dto_week_by_home.g.dart';

@JsonSerializable()
class DtoWeekByHome {
  DtoWeekByHome({
    required this.weekNumber,
    required this.weekDescription,
    this.weekProducts,
  });

  @JsonKey(name: 'semanaNum')
  final String weekNumber;
  @JsonKey(name: 'semanaDescripcion')
  final String weekDescription;
  @JsonKey(name: 'semana', includeIfNull: false)
  final List<DtoProductByWeek>? weekProducts;

  factory DtoWeekByHome.fromJson(Map<String, dynamic> json) =>
      _$DtoWeekByHomeFromJson(json);

  Map<String, dynamic> toJson() => _$DtoWeekByHomeToJson(this);
}
