import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:local_auth/local_auth.dart';
import 'package:notification_listener/notification_listener.dart';
import 'package:testapp/core/constant/apptheme.dart';
import 'package:testapp/core/services/services.dart';
import '../functions/fcm.dart';

class Localcontroller extends GetxController {
  Locale? language;
  ThemeData Apptheme = EnglishTheme;
  MyServices myservices = Get.find();
  late final LocalAuthentication auth;
  bool supportState = false;

  void onInit() {
    get_notification_permision();
    requistpermitionnotfy();
    printconfig();
    get_location_permision();
    check_app_lang();
   // handling_notification();
    super.onInit();
  }

  check_app_lang() {
    String? sharedPrefRence = myservices.sharedPreferences.getString("lang");
    if (sharedPrefRence == "ar") {
      language = const Locale("ar");
      Apptheme = ArabicTheme;
      update();
    } else if (sharedPrefRence == "en") {
      language = const Locale("en");
      Apptheme = EnglishTheme;
      update();
    } else {
      language = Locale(Get.deviceLocale!.languageCode);
      Apptheme = EnglishTheme;
      update();
    }
  }

  changelang(String langcode) {
    Locale local = Locale(langcode);
    myservices.sharedPreferences.setString("lang", langcode);
    Apptheme = langcode == "ar" ? ArabicTheme : EnglishTheme;
    Get.updateLocale(local);
    Get.changeTheme(Apptheme);
    update();
  }

  get_notification_permision() async {
    final bool isGranted = await AndroidNotificationListener.isGranted();
    if (isGranted) {
      print('Notification access granted!');
    } else {
      AndroidNotificationListener.request();
      print('Notification access denied.');
    }
  }

  get_location_permision() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Get.snackbar("خطا", "من فضلك قم بتفعيل خدمه الموقع");
    }

    permission = await Geolocator.checkPermission();

    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Get.snackbar("خطا", "من فضلك قم بتفعيل خدمه الموقع");
      }
    }
    if (permission == LocationPermission.deniedForever) {
      return Get.snackbar(
          "خطا", "لا يمكنك استخدام التطبيق بدون تفعيل خدمه الموقع");
    }
    return await Geolocator.getCurrentPosition();
  }

  Future<void> getAvailableBiometrics() async {
    List<BiometricType> availableBiometrics =
        await auth.getAvailableBiometrics();

    print("List of availableBiometrics : $availableBiometrics");

    // than we can call update
  }

  Future<void> authenticate() async {
    getAvailableBiometrics();
    try {
      bool authenticated = await auth.authenticate(
        localizedReason:
            'Subcribe or you will never find any stack overflow answer',
        options: const AuthenticationOptions(
          stickyAuth: true,
          biometricOnly: true,
        ),
      );

      print("Authenticated : $authenticated");
    } on PlatformException catch (e) {
      print(e);
    }
  }
}
