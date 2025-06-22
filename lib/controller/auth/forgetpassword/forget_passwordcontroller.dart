import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:testapp/core/class/statuesrequest.dart';
import 'package:testapp/core/constant/app_routes.dart';
import 'package:testapp/core/data/datasource/remote/auth/forgetpassword/checkmail.dart';
import 'package:testapp/core/functions/handlingdata.dart';
import 'package:testapp/core/functions/main-alert.dart';


abstract class ForgetPassController extends GetxController {
  late TextEditingController checkemail;
  GlobalKey<FormState> formstate = GlobalKey<FormState>();
  StatusRequest statusRequest = StatusRequest.none;
  CheckmailData checkmaildata = CheckmailData(Get.find());
  check_email();
  // go_to_verifycode();
}

class Forgetpasscontrollerimp extends ForgetPassController {
  @override
  check_email() async {
    if (formstate.currentState!.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      var response = await checkmaildata.cheeckmaildata(checkemail.text);
      print(checkemail.text);
      print("=============================== Controller $response ");
      statusRequest = Handlingdata(response);
      if (StatusRequest.success == statusRequest) {
        if (response['status'] == "success") {
          Get.toNamed(AppRoutes.verifycode,
              arguments: {"email": checkemail.text});
        } else {
          mainalert("57".tr, "58".tr);
          statusRequest = StatusRequest.failure;
        }
      }
      update();
    } else {}
  }

  @override
  void onInit() {
    checkemail = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    checkemail.dispose();
    super.dispose();
  }

  // @override
  // go_to_verifycode() {
  //   Get.toNamed(AppRoutes.verifycode);
  // }
}
