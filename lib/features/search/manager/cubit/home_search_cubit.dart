import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_doctor/features/home/data/model/drug_model.dart';
import 'package:my_doctor/features/search/data/repo/home_search_repo.dart';

part 'home_search_state.dart';

class HomeSearchCubit extends Cubit<HomeSearchState> {
  final HomeSearchRepo _homeSearchRepo;

  HomeSearchCubit(this._homeSearchRepo) : super(HomeSearchInitial());

  Future<void> searchFavorites(String query) async {
    emit(HomeSearchLoading());
    try {
      final results = await _homeSearchRepo.searchFavorites(query);
      emit(HomeSearchLoaded(results: results));
    } catch (e) {
      emit(HomeSearchError(message: e.toString()));
    }
  }
}
