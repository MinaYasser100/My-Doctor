import 'package:my_doctor/features/home/data/model/drug_model.dart';

abstract class HomeRepo {
  Future<List<DrugModel>> fetchPopularMedicines();
}
