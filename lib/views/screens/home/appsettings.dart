import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:testapp/controller/home/Settings_controller.dart';
import 'package:testapp/core/constant/colors.dart';
import 'package:testapp/core/constant/imageasset.dart';

class Appsettings extends StatelessWidget {
  const Appsettings({super.key});

  @override
  Widget build(BuildContext context) {
    SettingsController controller = Get.put(SettingsController());
    return Scaffold(
        appBar: AppBar(
          title: Text("183".tr),
          centerTitle: true,
        ),
        body: ListView(
          children: [
            Stack(
              alignment: Alignment.center,
              clipBehavior: Clip.none,
              children: [
                Container(
                  margin: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: AppColors.white,
                  ),
                  height: Get.width / 2.3,
                  child: Image.asset(
                    AppImage.edu_content_photo,
                    width: 500,
                    height: 500,
                  ),
                ),
                Positioned(
                  child: Container(
                    padding: EdgeInsets.all(7),
                    decoration: BoxDecoration(
                        color: AppColors.white,
                        borderRadius: BorderRadius.circular(50)),
                    child: CircleAvatar(
                      backgroundColor: Colors.grey[100],
                      radius: 35,
                      child: Image.asset(
                        AppImage.man_image,
                        width: 60,
                        height: 60,
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  top: Get.width / 2.9,
                )
              ],
            ),
            SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Card(
                child: Column(
                  children: [
                    GetBuilder<SettingsController>(
                      builder: (controller) => SwitchListTile(
                          hoverColor: AppColors.white,
                          trackColor: WidgetStatePropertyAll(Colors.white),
                          activeColor: AppColors.green,
                          title: Text("181".tr),
                          value: controller.myServices.sharedPreferences
                                      .getBool('notificationsEnabled') ==
                                  true
                              ? true
                              : false,
                          onChanged: (value) =>
                              controller.toggleNotifications(value)),
                    ),
                    Divider(),
                    ListTile(
                      title: Text("193".tr,
                          style: TextStyle(
                            color: Theme.of(context)
                                .textTheme
                                .headlineLarge!
                                .color,
                          )),
                      trailing: Icon(Icons.language),
                      onTap: () {
                        Get.defaultDialog(
                            title: "193".tr,
                            content: Column(
                              children: [
                                ListTile(
                                  title: Text("194".tr),
                                  onTap: () {
                                    Get.updateLocale(Locale('en', 'US'));
                                    Get.forceAppUpdate();
                                    Get.back();
                                  },
                                ),
                                ListTile(
                                  title: Text("195".tr),
                                  onTap: () {
                                    Get.updateLocale(Locale('ar', 'EG'));
                                    Get.forceAppUpdate();
                                    Get.back();
                                  },
                                ),
                              ],
                            ));
                      },
                    ),
                    Divider(),
                    ListTile(
                      onTap: () {
                        controller.get_notification_permision();
                      },
                      title: Text(
                        "184".tr,
                        style: TextStyle(color: Colors.green),
                      ),
                      trailing: Icon(Icons.notifications),
                    ),
                    Divider(),
                    ListTile(
                      onTap: () {
                        controller.signout();
                      },
                      title: Text(
                        "90".tr,
                        style: TextStyle(color: Colors.red),
                      ),
                      trailing: Icon(Icons.exit_to_app),
                    ),
                  ],
                ),
              ),
            )
          ],
        ));
  }
}
