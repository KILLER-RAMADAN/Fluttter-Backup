import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:testapp/core/class/statuesrequest.dart';
import 'package:testapp/core/constant/app_routes.dart';
import 'package:testapp/core/data/datasource/remote/auth/signup.dart';
import 'package:testapp/core/functions/handlingdata.dart';
import 'package:testapp/core/functions/main-alert.dart';
import 'package:testapp/core/services/services.dart';

import '../../core/functions/check_whatssapp.dart';

abstract class Signupcontroller extends GetxController {
  signup();
  go_to_forget_pass();
  show_password();
}

class Signupcontrollerimp extends Signupcontroller {
  late TextEditingController username;
  late TextEditingController email;
  late TextEditingController phone;
  late TextEditingController password;
  late TextEditingController countrycode;
  late TextEditingController countryname;
  GlobalKey<FormState> formstate = GlobalKey<FormState>();
  bool isshowpassword = true;
  SignupData signupdata = SignupData(Get.find());
  MyServices myservices = Get.find();

  List data = [];

  StatusRequest statusRequest = StatusRequest.none;
  @override
  signup() async {
    if (formstate.currentState!.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      var response = await signupdata.postsignupdata(username.text, email.text,
          phone.text, password.text, countrycode.text, countryname.text);
      print("=============================== Controller $response ");
      statusRequest = Handlingdata(response);
      if (StatusRequest.success == statusRequest) {
        if (response['status'] == "success") {
          print(phone.text);
          // data.addAll(response['data']);
          openWhatsApp(phone.text);
          // Get.offAllNamed(AppRoutes.verifycodesignup,
          //     arguments: {"email": email.text});
        } else {
          mainalert("57".tr, "63".tr);
          statusRequest = StatusRequest.failure;
        }
      }
      update();
    } else {
      print("Not Validate");
      print(username.text);
    }
  }

  @override
  void onInit() {
    username = TextEditingController();
    email = TextEditingController();
    phone = TextEditingController();
    password = TextEditingController();
    countrycode = TextEditingController();
    countryname = TextEditingController();

    super.onInit();
  }

  @override
  void dispose() {
    username.dispose();
    email.dispose();
    phone.dispose();
    password.dispose();
    countrycode.dispose();
    countryname.dispose();
    super.dispose();
  }

  @override
  go_to_forget_pass() {
    Get.toNamed(AppRoutes.forgetpass);
  }

  @override
  show_password() {
    isshowpassword = isshowpassword == true ? false : true;
    update();
  }
}
