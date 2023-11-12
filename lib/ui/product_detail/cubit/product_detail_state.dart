part of 'product_detail_cubit.dart';

class ProductDetailState extends Equatable {
  const ProductDetailState({
    this.status = CubitStatus.initial,
    this.product,
    this.error,
  });

  final CubitStatus status;
  final Product? product;
  final String? error;

  @override
  List<Object?> get props => [
        status,
        product,
        error,
      ];

  ProductDetailState copyWith({
    CubitStatus? status,
    Product? product,
    String? error,
  }) {
    return ProductDetailState(
      status: status ?? this.status,
      product: product ?? this.product,
      error: error,
    );
  }
}
