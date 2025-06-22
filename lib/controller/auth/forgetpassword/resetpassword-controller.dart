import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:testapp/core/class/statuesrequest.dart';
import 'package:testapp/core/constant/app_routes.dart';
import 'package:testapp/core/data/datasource/remote/auth/forgetpassword/reset_account_pass.dart';
import 'package:testapp/core/functions/handlingdata.dart';
import 'package:testapp/core/functions/main-alert.dart';


abstract class Resetpasswordcontroller extends GetxController {
  late TextEditingController mainpass;
  late TextEditingController repass;
  GlobalKey<FormState> formstate = GlobalKey<FormState>();
  bool isshowpassword = true;
  StatusRequest statusRequest = StatusRequest.none;
  ResetAccountPassword verifycodedata = ResetAccountPassword(Get.find());
  String? email;

  ResetPassword();
  // go_to_succesresetpass();
  showpassword();
}

class Resetpasswordcontrollerimp extends Resetpasswordcontroller {
  @override
  ResetPassword() async {
    if (formstate.currentState!.validate()) {
      if (mainpass.text == repass.text) {
        statusRequest = StatusRequest.loading;
        update();
        var response =
            await verifycodedata.postresetpassdata(email!, mainpass.text);
        print("=============================== Controller $response ");
        statusRequest = Handlingdata(response);
        if (StatusRequest.success == statusRequest) {
          if (response['status'] == "success") {
            Get.offNamed(AppRoutes.successresetpass);
          } else {
            mainalert("57".tr, "59".tr);
          }
        }
      } else {
        mainalert("57".tr, "60".tr);
        statusRequest = StatusRequest.failure;
      }
      update();
    } else {}
  }

  @override
  void onInit() {
    mainpass = TextEditingController();
    repass = TextEditingController();
    email = Get.arguments["email"];
    super.onInit();
  }

  @override
  void dispose() {
    mainpass.dispose();
    repass.dispose();
    super.dispose();
  }

  // @override
  // go_to_succesresetpass() {
  //   Get.offNamed(AppRoutes.successresetpass);
  // }

  @override
  showpassword() {
    isshowpassword = isshowpassword == true ? false : true;
    update();
  }
}
