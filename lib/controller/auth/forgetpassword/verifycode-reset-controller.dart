import 'package:get/get.dart';
import 'package:testapp/core/class/statuesrequest.dart';
import 'package:testapp/core/constant/app_routes.dart';
import 'package:testapp/core/data/datasource/remote/auth/forgetpassword/verifycode_resetpass.dart';
import 'package:testapp/core/functions/handlingdata.dart';
import 'package:testapp/core/functions/main-alert.dart';

abstract class Verifycodecontroller extends GetxController {
  String? email;
  StatusRequest statusRequest = StatusRequest.none;
  Verifycode_reset verifycodedata = Verifycode_reset(Get.find());
  check_code(String Code);
  // go_to_resetpass();
}

class Verifycodecontrollerimp extends Verifycodecontroller {
  @override
  check_code(Code) async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await verifycodedata.postverifycoderesetdata(email!, Code);
    statusRequest = Handlingdata(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        Get.offAllNamed(AppRoutes.resetpass, arguments: {"email": email});
      } else {
        mainalert("57".tr, "61".tr);
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  @override
  void onInit() {
    email = Get.arguments["email"];
    super.onInit();
  }

  // @override
  // go_to_resetpass() {
  //   Get.offAllNamed(AppRoutes.resetpass);
  // }
}
