
import 'package:get/get.dart';
import 'package:testapp/core/class/statuesrequest.dart';
import 'package:testapp/core/constant/app_routes.dart';
import 'package:testapp/core/data/datasource/remote/auth/forgetpassword/verifycode_signup.dart';
import 'package:testapp/core/functions/handlingdata.dart';
import 'package:testapp/core/functions/main-alert.dart';


abstract class Verifysignupcontroller extends GetxController {
  String? verifycode;

  String? email;

  StatusRequest statusRequest = StatusRequest.none;

  Verifycode verifycodedata = Verifycode(Get.find());

  check_code(String code);
  go_to_sucesssignup();
}

class Verifysignupcontrollerimp extends Verifysignupcontroller {
  @override
  check_code(code) async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await verifycodedata.postverifycodedata(email!, code);
    statusRequest = Handlingdata(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        go_to_sucesssignup();
      } else {
        mainalert("57".tr, "61".tr);
        statusRequest = StatusRequest.failure;
        //Get.offNamed(AppRoutes.login);
      }
    }
    update();
  }

  @override
  void onInit() {
    email = Get.arguments["email"];
    super.onInit();
  }

  @override
  go_to_sucesssignup() {
    Get.offAllNamed(AppRoutes.successsignup);
  }
}
