import 'package:hive/hive.dart';
import 'package:my_doctor/core/helper_network/app_const.dart';
import 'package:my_doctor/core/helper_network/dio_helper.dart';
import 'package:my_doctor/core/utils/constant.dart';
import 'package:my_doctor/features/home/data/model/drug_model.dart';
import 'package:my_doctor/features/home/data/repo/home_repo.dart';

class HomeRepoImpl implements HomeRepo {
  final DioHelper _dioHelper;

  HomeRepoImpl({required DioHelper dioHelper}) : _dioHelper = dioHelper;

  @override
  Future<List<DrugModel>> fetchPopularMedicines() async {
    final cacheBox = Hive.box(Constant.favoritsBox);
    try {
      // Check cache first
      final cachedMedicines = cacheBox.get(Constant.popularMedicines);
      if (cachedMedicines != null && cachedMedicines is List) {
        return cachedMedicines
            .map((e) => DrugModel.fromJson(Map<String, dynamic>.from(e as Map)))
            .toList();
      }

      // Fetch from API with pagination
      final response = await _dioHelper.getData(
        endpoint: AppConst.spls,
        query: {'limit': 10},
      );
      final medicines = (response.data['data'] as List)
          .map((e) => DrugModel.fromJson(Map<String, dynamic>.from(e as Map)))
          .toList();

      // Cache the results
      await cacheBox.put(
        Constant.popularMedicines,
        medicines.map((e) => e.toJson()).toList(),
      );
      return medicines;
    } catch (e) {
      throw Exception('Failed to fetch popular medicines: $e');
    }
  }
}
