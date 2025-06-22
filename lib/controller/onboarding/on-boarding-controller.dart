
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import "package:get/get.dart";
import 'package:testapp/core/constant/app_routes.dart';
import 'package:testapp/core/data/datasource/static/static.dart';
import 'package:testapp/core/services/services.dart';

abstract class On_Boarding_controller extends GetxController {
  next();
  onpagechanged(int index);
  skip_btn();
  MyServices myservices = Get.find();
}

class On_Boarding_imp extends On_Boarding_controller {
  int current_page = 0;
  late PageController pageController;

  @override
  next() {
    current_page++;
    print(current_page);
    if (current_page > on_boarding_list.length - 1) {
      myservices.sharedPreferences.setString("step", "1");
      Get.offAllNamed(AppRoutes.login);
    } else {
      pageController.animateToPage(current_page,
          duration: Duration(milliseconds: 600), curve: Curves.easeInOut);
    }
  }

  @override
  onpagechanged(int index) {
    current_page = index;
    update();
  }

  @override
  void onInit() {
    pageController = PageController();
    super.onInit();
  }

  @override
  skip_btn() {
    myservices.sharedPreferences.setString("step", "1");
    Get.offAllNamed(AppRoutes.login);
  }
}
