import 'package:fantastico_app/models/models.dart';

class Week {
  Week({
    required this.products,
    required this.quantity,
  });

  Week.empty()
      : products = [],
        quantity = 0;

  final List<Product> products;
  final int quantity;
}
