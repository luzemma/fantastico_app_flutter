import 'package:fantastico_app/models/home_week_product.dart';

class HomeWeek {
  HomeWeek({
    required this.weekNumber,
    required this.weekDescription,
    this.weekProducts,
  });

  final int weekNumber;
  final String weekDescription;
  final List<HomeWeekProduct>? weekProducts;
}
