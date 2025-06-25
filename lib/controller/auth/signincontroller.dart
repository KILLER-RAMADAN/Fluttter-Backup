import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:local_auth/local_auth.dart';
import 'package:testapp/core/class/statuesrequest.dart';
import 'package:testapp/core/constant/app_routes.dart';
import 'package:testapp/core/constant/colors.dart';
import 'package:testapp/core/data/datasource/remote/auth/login.dart';
import 'package:testapp/core/functions/handlingdata.dart';
import 'package:testapp/core/functions/main-alert.dart';
import 'package:testapp/core/services/services.dart';

abstract class Signincontroller extends GetxController {
  // SendNotificationController send_notify =
  //     Get.put(SendNotificationController());
  late TextEditingController email;
  late TextEditingController password;
  GlobalKey<FormState> formstate = GlobalKey<FormState>();

  bool isshowpassword = true;
  late int check_state = 0;
  late final LocalAuthentication auth;
  bool supportState = false;

  StatusRequest statusRequest = StatusRequest.none;

  LoginData logindata = LoginData(Get.find());

  MyServices myservices = Get.find();

  login();
  go_to_signup_page();
  go_to_forget_pass();
  show_password();
}

class Signincontrollerimp extends Signincontroller {
  @override
  go_to_signup_page() {
    Get.toNamed(AppRoutes.SignUp);
  }

  @override
  login() async {
    if (formstate.currentState != null && formstate.currentState!.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      var response = await logindata.postlogindata(email.text, password.text);
      print("=============================== Controller $response ");
      statusRequest = Handlingdata(response);
      if (StatusRequest.success == statusRequest) {
        if (response['status'] == "success") {
          myservices.sharedPreferences
              .setString("email", response['data']["user_email"].toString());
          myservices.sharedPreferences
              .setString("id", response['data']["user_id"].toString());
          myservices.sharedPreferences
              .setString("phone", response['data']["user_phone"].toString());
          myservices.sharedPreferences
              .setString("username", response['data']["user_name"].toString());
          myservices.sharedPreferences.setString(
              "password", response['data']["user_password"].toString());

          myservices.sharedPreferences.setString("step", "2");
          Get.offNamed(AppRoutes.home);
        } else {
          mainalert("57".tr, "62".tr);
          statusRequest = StatusRequest.failure;
        }
      }
      update();
    } else {}
  }

  initial_fingerprint(int state) {
    check_state = state;
    update();
    auth.isDeviceSupported().then(
      (bool isSupported) {
        supportState = isSupported;
        if (supportState == true) {
          update();
          getAvailableBiometrics();
        } else {
          Get.snackbar("57".tr, "186".tr,
              backgroundColor: Colors.red, colorText: AppColors.white);
        }
      },
    );
  }

  Future<void> getAvailableBiometrics() async {
    if (myservices.sharedPreferences.getString("step") == "2") {
      List<BiometricType> availableBiometrics =
          await auth.getAvailableBiometrics();
      if (availableBiometrics.isNotEmpty) {
        authenticate();
      } else {
        Get.dialog(AlertDialog(
          title: Text("187".tr),
          content: Text("186".tr),
          actions: [
            TextButton(
              onPressed: () {
                authenticate();
              },
              child: Text("188".tr),
            ),
            SizedBox(
              width: 50,
            ),
            TextButton(
              onPressed: () {
                Get.back();
              },
              child: Text("189".tr),
            ),
          ],
        ));
      }

      print("List of availableBiometrics : $availableBiometrics");
    } else {
      if (check_state == 0) {
        Get.snackbar("57".tr, "190".tr,
            backgroundColor: Colors.red, colorText: AppColors.white);
      }
    }

    // than we can call update
  }

  Future<void> authenticate() async {
    try {
      bool authenticated = await auth.authenticate(
        localizedReason: "191".tr,
        // message for dialog
        options: const AuthenticationOptions(
          stickyAuth: true,
          biometricOnly: true,
        ),
      );

      print("Authenticated : $authenticated");
      if (authenticated == true) {
        myservices.sharedPreferences.setBool("isauth", authenticated);
        Get.offNamed(AppRoutes.home);
        update();
      } else {
        Get.snackbar("57".tr, "192".tr,
            backgroundColor: Colors.red, colorText: AppColors.white);
      }
    } on PlatformException catch (e) {
      print(e);
    }
  }

  @override
  void onInit() async {
    auth = LocalAuthentication();
    email = TextEditingController();
    password = TextEditingController();
    FirebaseMessaging.instance.getToken().then((value) {
      print(value);
      email.text = value.toString();
    });
    // initial_fingerprint(1);
    super.onInit();
  }

  @override
  void dispose() {
    email.dispose();
    password.dispose();
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
