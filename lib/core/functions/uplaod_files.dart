import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:image_picker/image_picker.dart';
import 'package:file_picker/file_picker.dart';
import 'package:testapp/core/constant/colors.dart';

imageuplaodcamera() async {
  final XFile? file = await ImagePicker()
      .pickImage(source: ImageSource.camera, imageQuality: 90);
  if (file != null) {
    return File(file.path);
  } else {
    return null;
  }
}

fileuplaodgallary() async {
  FilePickerResult? result = await FilePicker.platform.pickFiles(
    type: FileType.custom,
    allowedExtensions: [
      'png',
      "PNG",
      "JPG",
      "svg",
      "SVG",
      "jpg",
      "jpeg",
      "JPEG",
      "gif",
      "GIF"
    ],
  );

  if (result != null) {
    return File(result.files.single.path!);
  } else {
    return null;
  }
}

showbottunmenu(imageuplaodcamera(), fileuplaodgallary()) {
  Get.bottomSheet(
      Directionality(
          textDirection: TextDirection.ltr,
          child: Container(
            padding: EdgeInsets.all(10),
            height: 200,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  child: Text(
                    "اختر صوره",
                    style: TextStyle(
                        fontSize: 22,
                        color: AppColors.fourth_color,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(padding: EdgeInsets.only(top: 10)),
                ListTile(
                  onTap: () {
                    imageuplaodcamera();
                    Get.back();
                  },
                  leading: Icon(Icons.camera_alt, size: 40),
                  title: Text(
                    "اختر صوره من الكاميرا",
                    style: TextStyle(fontSize: 22),
                  ),
                ),
                ListTile(
                  onTap: () {
                    fileuplaodgallary();
                    Get.back();
                  },
                  leading: Icon(Icons.image, size: 40),
                  title: Text(
                    "اختر صوره من الملفات",
                    style: TextStyle(fontSize: 22),
                  ),
                )
              ],
            ),
          )),
      backgroundColor: AppColors.white);
}
