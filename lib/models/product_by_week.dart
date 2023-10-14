class ProductByWeek {
  ProductByWeek({
    required this.quantity,
    required this.productId,
    required this.productImage,
    this.productName,
    this.productLine,
    this.productPrice,
  });

  final String productId;
  final String? productName;
  final String? productLine;
  final String? productPrice;
  final String productImage;
  final int quantity;
}
