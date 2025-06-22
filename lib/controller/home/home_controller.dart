import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notification_listener/models/notification.dart';
import 'package:notification_listener/notification_listener.dart';

import 'package:testapp/core/class/statuesrequest.dart';
import 'package:testapp/core/functions/uplaod_files.dart';

class HomeController extends GetxController {


  StatusRequest statusRequest = StatusRequest.none;

  RxList notification_list = RxList<AndroidNotificationEvent>();

  File? image;

  choose_image_func() async {
    image = await fileuplaodgallary();
    print(image);
    update();
  }

  choose_camer_image_func() async {
    image = await imageuplaodcamera();
    print(image);

    update();
  }

  select_image_path() {
    showbottunmenu(choose_camer_image_func, choose_image_func);
  }

  lsiten_notification() {
    notification_list.clear();
    AndroidNotificationListener.accessStream.listen((event) {
      print("Notification from ${event}");
      notification_list.add(event);
      print("test=>>>>>${notification_list}");
    });
  }

  get_notification_permision() async {
    final bool isGranted = await AndroidNotificationListener.isGranted();
    if (isGranted) {
      lsiten_notification();
      print('Notification access granted!');
    } else {
      AndroidNotificationListener.request();
      print('Notification access denied.');
    }
  }

  
 

  @override
  void onInit() {
    lsiten_notification();
    get_notification_permision();

    super.onInit();
  }

  @override
  void dispose() {
    notification_list.clear();
    super.dispose();
  }
}
