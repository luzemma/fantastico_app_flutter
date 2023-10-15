import 'package:fantastico_app/models/models.dart';

class Week {
  Week({
    required this.products,
    required this.quantity,
  });

  final List<Product> products;
  final int quantity;
}
