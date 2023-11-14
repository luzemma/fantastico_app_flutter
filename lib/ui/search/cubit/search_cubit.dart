import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:fantastico_app/models/enums/cubit_status.dart';
import 'package:fantastico_app/models/week.dart';
import 'package:fantastico_app/repositories/product_repository.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit({
    required ProductRepository productRepo,
  })  : _productRepository = productRepo,
        super(const SearchState());

  Future<void> onSearch(String text) async {
    emit(state.copyWith(status: CubitStatus.loading));
    try {
      final data =
          await _productRepository.getProductsBySearchingWords(text.split(' '));
      emit(state.copyWith(status: CubitStatus.success, data: data));
    } catch (e) {
      emit(
        state.copyWith(status: CubitStatus.failure, error: e.toString()),
      );
    }
  }

  final ProductRepository _productRepository;
}
