import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:fantastico_app/models/enums/cubit_status.dart';
import 'package:fantastico_app/models/week.dart';
import 'package:fantastico_app/repositories/product_repository.dart';

part 'product_week_state.dart';

class ProductWeekCubit extends Cubit<ProductWeekState> {
  ProductWeekCubit({
    required ProductRepository productRepo,
    required int weekNumber,
    required String title,
  })  : _productRepository = productRepo,
        super(
          ProductWeekState(
            weekNumber: weekNumber,
            title: title,
          ),
        );

  Future<void> onInitial() async {
    emit(state.copyWith(status: CubitStatus.loading));
    try {
      final data =
          await _productRepository.getProductsByWeekNumber(state.weekNumber);
      emit(state.copyWith(status: CubitStatus.success, data: data));
    } catch (e) {
      emit(
        state.copyWith(status: CubitStatus.failure, error: e.toString()),
      );
    }
  }

  final ProductRepository _productRepository;
}
