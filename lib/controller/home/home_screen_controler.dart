import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:testapp/core/class/statuesrequest.dart';
import 'package:testapp/views/screens/home/appsettings.dart';
import 'package:testapp/views/screens/home/home.dart';

abstract class HomeScreenControler extends GetxController {
  changepage(int currentpage);

  StatusRequest statusRequest = StatusRequest.none;
}

class HomeScreenControlerimp extends HomeScreenControler {
  int currentindex = 0;
  void onInit() {
    initialdata();
    super.onInit();
  }

  initialdata() {
    pages;
  }

  List<Widget> pages = [
    Home(),
    Appsettings(),
  ];

  List<IconData> listOfIcons = [
    Icons.home_rounded,
    Icons.messenger,
    Icons.settings,
  ];

  @override
  changepage(i) {
    currentindex = i;
    update();
  }
}
