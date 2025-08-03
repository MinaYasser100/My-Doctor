import 'package:get_it/get_it.dart';
import 'package:my_doctor/core/helper_network/dio_helper.dart';
import 'package:my_doctor/features/home/data/repo/home_repo_impl.dart';
import 'package:my_doctor/features/search/data/repo/home_search_repo_impl.dart';

final getIt = GetIt.instance;

void setupDependencies() async {
  // Dio
  getIt.registerSingleton<DioHelper>(DioHelper());
  //
  getIt.registerSingleton<HomeRepoImpl>(
    HomeRepoImpl(dioHelper: getIt<DioHelper>()),
  );
  //
  getIt.registerSingleton<HomeSearchRepoImpl>(HomeSearchRepoImpl());
}
