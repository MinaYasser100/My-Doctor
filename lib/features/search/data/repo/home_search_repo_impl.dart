import 'package:hive/hive.dart';
import 'package:my_doctor/core/utils/constant.dart';
import 'package:my_doctor/features/home/data/model/drug_model.dart';
import 'package:my_doctor/features/search/data/repo/home_search_repo.dart';

class HomeSearchRepoImpl implements HomeSearchRepo {
  HomeSearchRepoImpl();

  @override
  Future<List<DrugModel>> searchFavorites(String query) async {
    final box = Hive.box(Constant.favoritsBox);
    try {
      final favorites = box.get(Constant.popularMedicines);
      if (favorites != null && favorites is List) {
        return favorites
            .whereType<Map>() // Ensure e is a Map
            .map((e) {
              try {
                return DrugModel.fromJson(Map<String, dynamic>.from(e));
              } catch (error) {
                return null;
              }
            })
            .where((drug) => drug != null) // Filter out nulls
            .where(
              (drug) =>
                  drug!.title?.toLowerCase().contains(
                    query.trim().toLowerCase(),
                  ) ??
                  false,
            )
            .cast<DrugModel>()
            .toList();
      }
      return [];
    } catch (e) {
      throw Exception('Failed to search favorites: $e');
    }
  }
}
