import 'package:my_doctor/features/home/data/model/drug_model.dart';

abstract class HomeSearchRepo {
  Future<List<DrugModel>> searchFavorites(String query);
}
