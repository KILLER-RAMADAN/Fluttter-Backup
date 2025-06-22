import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

Future<bool> mainalert(
  String title,
  String midtitle,
) {
  Get.defaultDialog(
      title: title,
      radius: 20,
      titlePadding: EdgeInsets.symmetric(vertical: 10),
      titleStyle: TextStyle(fontFamily: "Cairo"),
      middleText: midtitle,
      middleTextStyle: TextStyle(fontFamily: "Cairo"),
      actions: [
        ElevatedButton(
            onPressed: () {
              Get.back();
            },
            child: Text("64".tr)),
      ]);

  return Future.value(true);
}
