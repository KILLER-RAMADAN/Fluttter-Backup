import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:testapp/core/services/services.dart';

class ThemeController extends GetxController {
  Rx<ThemeMode> themeMode = ThemeMode.light.obs;
  MyServices myServices = Get.find<MyServices>();

  bool get isDarkMode => themeMode.value == ThemeMode.dark;

  @override
  void onInit() {
    check_theeme();
    super.onInit();
  }

  void check_theeme() {
    String? savedTheme = myServices.sharedPreferences.getString("theme");
    if (savedTheme == "dark") {
      themeMode.value = ThemeMode.dark;
      Get.changeThemeMode(ThemeMode.dark);
    } else {
      themeMode.value = ThemeMode.light;
      Get.changeThemeMode(ThemeMode.light);
    }
  }

  void toggleTheme() {
    if (isDarkMode) {
      setLightMode();
    } else {
      setDarkMode();
    }
  }

  void setDarkMode() {
    themeMode.value = ThemeMode.dark;
    Get.changeThemeMode(ThemeMode.dark);
    myServices.sharedPreferences.setString("theme", "dark");
    update();
  }

  void setLightMode() {
    themeMode.value = ThemeMode.light;
    Get.changeThemeMode(ThemeMode.light);
    myServices.sharedPreferences.setString("theme", "light");
    update();
  }
}
