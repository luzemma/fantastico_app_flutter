import 'package:collection/collection.dart';
import 'package:fantastico_api_client/fantastico_api_client.dart';
import 'package:fantastico_app/models/models.dart';
import 'package:fantastico_app/utils/image_helper.dart';
import 'package:fantastico_app/utils/string_extension.dart';

ProductByWeek? dtoToProductByWeek(DtoProductByWeek? dto, String baseImageUrl) {
  if (dto != null) {
    return ProductByWeek(
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

WeekByHome? dtoToWeekByHome(DtoWeekByHome? dto, String baseImageUrl) {
  if (dto != null) {
    return WeekByHome(
      weekNumber: dto.weekNumber.toInteger() ?? 0,
      weekDescription: dto.weekDescription,
      weekProducts: dto.weekProducts != null
          ? dto.weekProducts!
              .map((e) => dtoToProductByWeek(e, baseImageUrl))
              .whereNotNull()
              .toList()
          : null,
    );
  }
  return null;
}
