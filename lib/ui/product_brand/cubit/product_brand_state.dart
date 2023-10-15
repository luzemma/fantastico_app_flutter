part of 'product_brand_cubit.dart';

class ProductBrandState extends Equatable {
  const ProductBrandState({
    required this.brandId,
    required this.title,
    this.status = CubitStatus.initial,
    this.data,
    this.error,
  });

  final CubitStatus status;
  final int brandId;
  final String title;
  final Week? data;
  final String? error;

  @override
  List<Object?> get props => [
        status,
        brandId,
        title,
        data,
        error,
      ];

  ProductBrandState copyWith({
    CubitStatus? status,
    int? brandId,
    String? title,
    Week? data,
    String? error,
  }) {
    return ProductBrandState(
      status: status ?? this.status,
      brandId: brandId ?? this.brandId,
      title: title ?? this.title,
      data: data ?? this.data,
      error: error,
    );
  }
}
