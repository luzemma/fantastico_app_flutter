import 'package:fantastico_app/models/product_by_week.dart';

class WeekByHome {
  WeekByHome({
    required this.weekNumber,
    required this.weekDescription,
    this.weekProducts,
  });

  final int weekNumber;
  final String weekDescription;
  final List<ProductByWeek>? weekProducts;
}
