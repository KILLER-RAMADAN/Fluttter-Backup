import 'package:get/get.dart';

validInput(String val, int min, int max, String Type) {
  if (Type == "username") {
    if (!GetUtils.isUsername(val)) {
      return "51".tr;
    }
  }

  if (Type == "email") {
    if (!GetUtils.isEmail(val)) {
      return "52".tr;
    }
  }

  if (Type == "phone") {
    if (!GetUtils.isPhoneNumber(val)) {
      return "53".tr;
    }
  }

  if (val.isEmpty) {
    return "54".tr;
  }

  if (val.length < min) {
    return "55".tr;
  }

  if (val.length > max) {
    return "56".tr;
  }
}
