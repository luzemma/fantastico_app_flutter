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
