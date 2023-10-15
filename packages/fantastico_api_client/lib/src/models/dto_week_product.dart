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
  final List<DtoProduct> comics;
  @JsonKey(name: 'libros')
  final List<DtoProduct> books;
  @JsonKey(name: 'revistas')
  final List<DtoProduct> magazines;
  @JsonKey(name: 'figuras')
  final List<DtoProduct> figures;
  @JsonKey(name: 'juegos')
  final List<DtoProduct> games;
  @JsonKey(name: 'tarjetas')
  final List<DtoProduct> cards;
  @JsonKey(name: 'posters')
  final List<DtoProduct> posters;
  @JsonKey(name: 'otros')
  final List<DtoProduct> others;

  factory DtoWeekProduct.fromJson(Map<String, dynamic> json) =>
      _$DtoWeekProductFromJson(json);

  Map<String, dynamic> toJson() => _$DtoWeekProductToJson(this);
}
