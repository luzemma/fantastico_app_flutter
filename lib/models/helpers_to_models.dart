import 'package:collection/collection.dart';
import 'package:fantastico_api_client/fantastico_api_client.dart';
import 'package:fantastico_app/models/models.dart';
import 'package:fantastico_app/utils/image_helper.dart';
import 'package:fantastico_app/utils/string_extension.dart';

HomeWeekProduct? dtoToHomeWeekProduct(
  DtoHomeWeekProduct? dto,
  String baseImageUrl,
) {
  if (dto != null) {
    return HomeWeekProduct(
      quantity: dto.quantity?.toInteger() ?? 0,
      productId: dto.productId,
      productName: dto.productName,
      productLine: dto.productLine,
      productPrice: dto.productPrice,
      productImage:
          '$baseImageUrl/${ImageHelper.getProductImagePath(dto.productImage)}',
    );
  }
  return null;
}

HomeWeek? dtoToHomeWeek(DtoHomeWeek? dto, String baseImageUrl) {
  if (dto != null) {
    return HomeWeek(
      weekNumber: dto.weekNumber.toInteger() ?? 0,
      weekDescription: dto.weekDescription,
      weekProducts: dto.weekProducts != null
          ? dto.weekProducts!
              .map((e) => dtoToHomeWeekProduct(e, baseImageUrl))
              .whereNotNull()
              .toList()
          : null,
    );
  }
  return null;
}

Availability? dtoToAvailability(DtoAvailability? dto) {
  if (dto != null) {
    return Availability(
      detail: dto.detail,
      shop: dto.shop,
    );
  }
  return null;
}

RelatedProduct? dtoToRelatedProduct(
  DtoRelatedProduct? dto,
  String baseImageUrl,
) {
  if (dto != null) {
    return RelatedProduct(
      id: dto.id,
      name: dto.name,
      line: dto.line,
      brand: dto.brand,
      price: dto.price,
      offerPrice: dto.offerPrice,
      imageFileName:
          '$baseImageUrl/${ImageHelper.getProductImagePath(dto.imageFileName)}',
    );
  }
  return null;
}

Product? dtoToProduct(DtoWeekProductItem? dto, String baseImageUrl) {
  if (dto != null) {
    return Product(
      id: dto.id,
      name: dto.name,
      line: dto.line,
      brand: dto.brand,
      synopsis: dto.synopsis,
      price: dto.price,
      offerPrice: dto.offerPrice,
      imageFileName:
          '$baseImageUrl/${ImageHelper.getProductImagePath(dto.imageFileName)}',
      isAvailableInVirtualShop: dto.isAvailableInVirtualShop,
      inWishlist: dto.inWishlist,
      relatedComics: dto.relatedProducts != null
          ? dto.relatedProducts!
              .map((e) => dtoToRelatedProduct(e, baseImageUrl))
              .whereNotNull()
              .toList()
          : null,
      availabilityDetail: dto.availabilityDetail != null
          ? dto.availabilityDetail!
              .map(dtoToAvailability)
              .whereNotNull()
              .toList()
          : null,
    );
  }
  return null;
}

List<Product> dtoToWeekProduct(DtoWeekProduct dto, String baseImageUrl) {
  final comics = dto.comics
      .map((e) => dtoToProduct(e, baseImageUrl))
      .whereNotNull()
      .toList();
  final books = dto.books
      .map((e) => dtoToProduct(e, baseImageUrl))
      .whereNotNull()
      .toList();
  final magazines = dto.magazines
      .map((e) => dtoToProduct(e, baseImageUrl))
      .whereNotNull()
      .toList();
  final figures = dto.figures
      .map((e) => dtoToProduct(e, baseImageUrl))
      .whereNotNull()
      .toList();
  final games = dto.games
      .map((e) => dtoToProduct(e, baseImageUrl))
      .whereNotNull()
      .toList();
  final cards = dto.cards
      .map((e) => dtoToProduct(e, baseImageUrl))
      .whereNotNull()
      .toList();
  final posters = dto.posters
      .map((e) => dtoToProduct(e, baseImageUrl))
      .whereNotNull()
      .toList();
  final others = dto.others
      .map((e) => dtoToProduct(e, baseImageUrl))
      .whereNotNull()
      .toList();

  final products = [
    ...comics,
    ...books,
    ...magazines,
    ...figures,
    ...games,
    ...cards,
    ...posters,
    ...others,
  ];
  return products;
}

Week dtoToWeek(DtoWeek dto, String baseImageUrl) {
  return Week(
    products: dtoToWeekProduct(dto.products, baseImageUrl),
    quantity: dto.quantity,
  );
}
