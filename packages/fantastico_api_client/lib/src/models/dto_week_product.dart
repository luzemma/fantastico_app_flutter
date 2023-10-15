// ignore_for_file: sort_constructors_first

import 'package:fantastico_api_client/src/models/models.dart';
import 'package:json_annotation/json_annotation.dart';

part 'dto_week_product.g.dart';

@JsonSerializable()
class DtoWeekProduct {
  DtoWeekProduct({
    required this.comics,
    required this.books,
    required this.magazines,
    required this.figures,
    required this.games,
    required this.cards,
    required this.posters,
    required this.others,
  });

  @JsonKey(name: 'comics')
  final List<DtoWeekProductItem> comics;
  @JsonKey(name: 'libros')
  final List<DtoWeekProductItem> books;
  @JsonKey(name: 'revistas')
  final List<DtoWeekProductItem> magazines;
  @JsonKey(name: 'figuras')
  final List<DtoWeekProductItem> figures;
  @JsonKey(name: 'juegos')
  final List<DtoWeekProductItem> games;
  @JsonKey(name: 'tarjetas')
  final List<DtoWeekProductItem> cards;
  @JsonKey(name: 'posters')
  final List<DtoWeekProductItem> posters;
  @JsonKey(name: 'otros')
  final List<DtoWeekProductItem> others;

  factory DtoWeekProduct.fromJson(Map<String, dynamic> json) =>
      _$DtoWeekProductFromJson(json);

  Map<String, dynamic> toJson() => _$DtoWeekProductToJson(this);
}
