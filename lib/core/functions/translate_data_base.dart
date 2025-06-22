
import 'package:get/get.dart';


import '../services/services.dart';

MyServices myServices = Get.find();

TranslateDataBase(columnar, columnen) {
  String? sharedPrefRence = myServices.sharedPreferences.getString("lang");
  if (sharedPrefRence == "ar") {
    return columnar;
  } else {
    return columnen;
  }
}
