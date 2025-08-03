import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_doctor/features/home/data/model/drug_model.dart';
import 'package:my_doctor/features/home/data/repo/home_repo.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final HomeRepo _homeRepo;

  HomeCubit(this._homeRepo) : super(HomeInitial());

  Future<void> fetchPopularMedicines() async {
    emit(HomeLoading());
    try {
      final medicines = await _homeRepo.fetchPopularMedicines();
      emit(HomeLoaded(medicines: medicines));
    } catch (e) {
      emit(HomeError(message: e.toString()));
    }
  }
}
