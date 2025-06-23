import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:testapp/core/constant/app_routes.dart';
import 'package:testapp/core/services/services.dart';

class Mymiddleware extends GetMiddleware {
  MyServices myservices = Get.find();

  int? priority = 1;

  RouteSettings? redirect(String? route) {
    if (myservices.sharedPreferences.getString("step") == "2") {
      return RouteSettings(name: AppRoutes.home);
    }

    if (myservices.sharedPreferences.getString("step") == "1") {
      return RouteSettings(name: AppRoutes.login);
    }

    return null;
  }
}
