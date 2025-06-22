import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

Future<bool> exitalert() {
  Get.defaultDialog(
      title: "66".tr,
      radius: 20,
      titlePadding: EdgeInsets.symmetric(vertical: 10),
      titleStyle: TextStyle(fontFamily: "Cairo"),
      middleText: "67".tr,
      middleTextStyle: TextStyle(fontFamily: "Cairo"),
      actions: [
        ElevatedButton(
            onPressed: () {
              exit(0);
            },
            child: Text("64".tr)),
        ElevatedButton(
            onPressed: () {
              Get.back();
            },
            child: Text("65".tr)),
      ]);

  return Future.value(true);
}

Future<bool> check_alert() {
 
  Get.defaultDialog(
      title: "66".tr,
      radius: 20,
      titlePadding: EdgeInsets.symmetric(vertical: 10),
      titleStyle: TextStyle(fontFamily: "Cairo"),
      middleText: "67".tr,
      middleTextStyle: TextStyle(fontFamily: "Cairo"),
      actions: [
        ElevatedButton(onPressed: () {
              Get.back();
            }, child: Text("Cancel".tr)),
        ElevatedButton(
            onPressed: () {
            
            },
            child: Text("Delete".tr)),
      ]);

  return Future.value(true);
}
