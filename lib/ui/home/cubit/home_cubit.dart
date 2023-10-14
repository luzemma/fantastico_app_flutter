import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:fantastico_app/models/enums/cubit_status.dart';
import 'package:fantastico_app/models/week_by_home.dart';
import 'package:fantastico_app/repositories/home_repository.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit({
    required HomeRepository homeRepository,
  })  : _homeRepository = homeRepository,
        super(const HomeState());

  Future<void> onInitial() async {
    emit(
      state.copyWith(status: CubitStatus.loading),
    );
    try {
      final result = await _homeRepository.getWeeks();
      emit(state.copyWith(status: CubitStatus.initial, weeks: result));
    } catch (e) {
      emit(
        state.copyWith(
          status: CubitStatus.failure,
          error: e.toString(),
        ),
      );
    }
  }

  final HomeRepository _homeRepository;
}
