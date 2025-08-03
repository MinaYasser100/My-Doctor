import 'package:hive_flutter/hive_flutter.dart';
import 'package:my_doctor/core/utils/constant.dart';
import 'package:my_doctor/features/home/data/model/drug_model.dart';

class HomeService {
  static Future<void> initHomeHiveHelper() async {
    if (!Hive.isAdapterRegistered(DrugModelAdapter().typeId)) {
      Hive.registerAdapter(DrugModelAdapter());
    }
    try {
      await Hive.initFlutter();
      await Hive.openBox(Constant.favoritsBox);
    } catch (e) {
      rethrow;
    }
  }
}
