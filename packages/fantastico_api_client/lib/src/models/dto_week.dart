// ignore_for_file: sort_constructors_first

import 'package:fantastico_api_client/src/models/dto_week_product.dart';
import 'package:fantastico_api_client/src/models/models.dart';
import 'package:json_annotation/json_annotation.dart';

part 'dto_week.g.dart';

@JsonSerializable()
class DtoWeek {
  DtoWeek({
    required this.products,
    required this.quantity,
  });

  @JsonKey(name: 'productos')
  final DtoWeekProduct products;
  @JsonKey(name: 'cantProductos')
  final int quantity;

  factory DtoWeek.fromJson(Map<String, dynamic> json) =>
      _$DtoWeekFromJson(json);

  Map<String, dynamic> toJson() => _$DtoWeekToJson(this);
}
