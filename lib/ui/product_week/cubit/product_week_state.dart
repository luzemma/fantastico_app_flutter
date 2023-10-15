part of 'product_week_cubit.dart';

class ProductWeekState extends Equatable {
  const ProductWeekState({
    required this.weekNumber,
    required this.title,
    this.status = CubitStatus.initial,
    this.data,
    this.error,
  });

  final CubitStatus status;
  final int weekNumber;
  final String title;
  final Week? data;
  final String? error;

  @override
  List<Object?> get props => [
        status,
        weekNumber,
        title,
        data,
        error,
      ];

  ProductWeekState copyWith({
    CubitStatus? status,
    int? weekNumber,
    String? title,
    Week? data,
    String? error,
  }) {
    return ProductWeekState(
      status: status ?? this.status,
      weekNumber: weekNumber ?? this.weekNumber,
      title: title ?? this.title,
      data: data ?? this.data,
      error: error,
    );
  }
}
