// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dto_week_product.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DtoWeekProduct _$DtoWeekProductFromJson(Map<String, dynamic> json) =>
    DtoWeekProduct(
      comics: (json['comics'] as List<dynamic>)
          .map((e) => DtoWeekProductItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      books: (json['libros'] as List<dynamic>)
          .map((e) => DtoWeekProductItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      magazines: (json['revistas'] as List<dynamic>)
          .map((e) => DtoWeekProductItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      figures: (json['figuras'] as List<dynamic>)
          .map((e) => DtoWeekProductItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      games: (json['juegos'] as List<dynamic>)
          .map((e) => DtoWeekProductItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      cards: (json['tarjetas'] as List<dynamic>)
          .map((e) => DtoWeekProductItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      posters: (json['posters'] as List<dynamic>)
          .map((e) => DtoWeekProductItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      others: (json['otros'] as List<dynamic>)
          .map((e) => DtoWeekProductItem.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$DtoWeekProductToJson(DtoWeekProduct instance) =>
    <String, dynamic>{
      'comics': instance.comics,
      'libros': instance.books,
      'revistas': instance.magazines,
      'figuras': instance.figures,
      'juegos': instance.games,
      'tarjetas': instance.cards,
      'posters': instance.posters,
      'otros': instance.others,
    };
