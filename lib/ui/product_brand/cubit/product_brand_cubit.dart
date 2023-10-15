import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:fantastico_app/models/enums/cubit_status.dart';
import 'package:fantastico_app/models/week.dart';
import 'package:fantastico_app/repositories/product_repository.dart';

part 'product_brand_state.dart';

class ProductBrandCubit extends Cubit<ProductBrandState> {
  ProductBrandCubit({
    required ProductRepository productRepo,
    required int brandId,
    required String title,
  })  : _productRepository = productRepo,
        super(
          ProductBrandState(
            brandId: brandId,
            title: title,
          ),
        );

  Future<void> onInitial() async {
    emit(state.copyWith(status: CubitStatus.loading));
    try {
      final data = await _productRepository.getProductsByBrandId(state.brandId);
      emit(state.copyWith(status: CubitStatus.success, data: data));
    } catch (e) {
      emit(
        state.copyWith(status: CubitStatus.failure, error: e.toString()),
      );
    }
  }

  final ProductRepository _productRepository;
}
