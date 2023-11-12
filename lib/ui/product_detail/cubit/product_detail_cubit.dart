import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:fantastico_app/models/enums/cubit_status.dart';
import 'package:fantastico_app/models/models.dart';
import 'package:fantastico_app/repositories/product_repository.dart';

part 'product_detail_state.dart';

class ProductDetailCubit extends Cubit<ProductDetailState> {
  ProductDetailCubit({
    required ProductRepository productRepo,
    required String? hashedId,
  })  : _productRepository = productRepo,
        _hashedId = hashedId,
        super(const ProductDetailState());

  Future<void> onInitial() async {
    if (_hashedId == null) return;
    emit(state.copyWith(status: CubitStatus.loading));
    try {
      final data = await _productRepository.getProductByHashedId(_hashedId!);
      emit(state.copyWith(status: CubitStatus.success, product: data));
    } catch (e) {
      emit(
        state.copyWith(status: CubitStatus.failure, error: e.toString()),
      );
    }
  }

  final ProductRepository _productRepository;
  final String? _hashedId;
}
