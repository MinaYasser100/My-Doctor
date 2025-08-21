import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_doctor/features/home/data/model/drug_model.dart';
import 'package:my_doctor/features/home/data/repo/home_repo.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final HomeRepo _homeRepo;
  final List<DrugModel> _allMedicines = [];

  HomeCubit(this._homeRepo) : super(HomeInitial());

  Future<void> fetchPopularMedicines() async {
    emit(HomeLoading());
    try {
      final medicines = await _homeRepo.fetchPopularMedicines();
      _allMedicines.addAll(medicines);
      emit(
        HomeLoaded(
          medicines: medicines,
          isFiltered: false,
          selectedCategoryQuery: null,
        ),
      );
    } catch (e) {
      emit(HomeError(message: e.toString()));
    }
  }

  void filterMedicines(String query) {
    try {
      final filteredMedicines = _allMedicines.where((medicien) {
        final title = medicien.title?.toLowerCase() ?? '';
        return title.contains(query.toLowerCase());
      }).toList();
      emit(
        HomeLoaded(
          medicines: filteredMedicines,
          isFiltered: true,
          selectedCategoryQuery: query,
        ),
      );
    } catch (e) {
      emit(HomeError(message: 'Failed to filter medicines'));
    }
  }

  void resetFilter() => emit(
    HomeLoaded(
      medicines: _allMedicines,
      isFiltered: false,
      selectedCategoryQuery: null,
    ),
  );
}
