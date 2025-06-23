import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:testapp/core/constant/app_routes.dart';
import 'package:testapp/core/constant/imageasset.dart';
import 'package:testapp/core/localizations/changelocal.dart';
import 'package:testapp/views/widgets/languages/lang_btn.dart';

class appLanguage extends GetView<Localcontroller> {
  const appLanguage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: Container(
        padding: const EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              AppImage.Lang_Image,
              width: double.infinity,
              height: 200,
              alignment: Alignment.center,
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "1".tr,
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            SizedBox(
              height: 20,
            ),
            lang_button(
              lang_name: "11".tr,
              onPressed: () {
                controller.changelang("ar");
                Get.toNamed(AppRoutes.onBoarding);
              },
            ),
            SizedBox(
              height: 15,
            ),
            lang_button(
              lang_name: "12".tr,
              onPressed: () {
                controller.changelang("en");
                Get.toNamed(AppRoutes.onBoarding);
              },
            ),
          ],
        ),
      ),
    );
  }
}
