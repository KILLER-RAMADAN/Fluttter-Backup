import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:testapp/controller/auth/signincontroller.dart';
import 'package:testapp/controller/themes/theme_controller.dart';
import 'package:testapp/core/class/handlingdataview.dart';
import 'package:testapp/core/constant/colors.dart';
import 'package:testapp/core/constant/imageasset.dart';
import 'package:testapp/core/functions/alert.dart';
import 'package:testapp/core/functions/check_whatssapp.dart';
import 'package:testapp/core/functions/valid_input.dart';
import 'package:testapp/core/shared/notification_access.dart';
import 'package:testapp/views/widgets/auth/auth_custome_btn.dart';
import 'package:testapp/views/widgets/auth/auth_signin_image.dart';
import 'package:testapp/views/widgets/auth/customebodylinetext.dart';
import 'package:testapp/views/widgets/auth/customeheadlinetext.dart';
import 'package:testapp/views/widgets/auth/forget_btn.dart';
import 'package:testapp/views/widgets/auth/signup_or_login_action_btn.dart';
import '../../widgets/auth/customeformfaildauth.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(Signincontrollerimp());
    ThemeController themeController = Get.find<ThemeController>();

    return Scaffold(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        appBar: AppBar(
          actions: [
            IconButton(
              icon: Icon(Icons.notifications, color: AppColors.grey),
              onPressed: () {
                get_notification_permision();
              },
            ),
            IconButton(
              icon: Icon(Icons.language_outlined, color: AppColors.grey),
              onPressed: () {
                Get.defaultDialog(
                  onCancel: () => Get.back(),
                  title: "193".tr,
                  content: Column(
                    children: [
                      ListTile(
                        title: Text("194".tr),
                        onTap: () {
                          Get.updateLocale(Locale('en', 'US'));
                          Get.back();
                        },
                      ),
                      ListTile(
                        title: Text("195".tr),
                        onTap: () {
                          Get.updateLocale(Locale('ar', 'EG'));
                          Get.back();
                        },
                      ),
                    ],
                  ),
                );
              },
            ),
            GetBuilder<ThemeController>(builder: (controller) {
              return IconButton(
                icon: Icon(
                  controller.isDarkMode ? Icons.dark_mode : Icons.light_mode,
                  color: Colors.grey,
                ),
                onPressed: () {
                  themeController.toggleTheme();
                },
              );
            }),
          ],
          leading: IconButton(
            icon: Icon(Icons.door_back_door, color: AppColors.grey),
            onPressed: () {
              exitalert();
            },
          ),
          centerTitle: true,
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          title: Text("14".tr,
              style: TextStyle(
                  color: AppColors.grey, fontWeight: FontWeight.bold)),
          elevation: 0.0,
        ),
        body: PopScope(
          canPop: false,
          onPopInvoked: (didPop) {
            exitalert();
          },
          child: GetBuilder<Signincontrollerimp>(
            builder: (controller) => SafeArea(
              child: HandlingDataViewRequest(
                statusRequest: controller.statusRequest,
                widget: Container(
                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                  child: Form(
                    key: controller.formstate,
                    child: ListView(
                      children: [
                        AuthSigninImage(
                          imag_height: 160,
                          head_iamg: AppImage.on_boarding_image_four,
                        ),
                        Customeheadlinetext(
                          Headline_Text: '15'.tr,
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Customebodylinetext(Body_Txet: '16'.tr),
                        const SizedBox(
                          height: 30,
                        ),
                        Customeformfaildauth(
                            hide_text: false,
                            Isnumber: false,
                            valid: (val) {
                              return validInput(val!, 5, 100, "email");
                            },
                            Text_Label: "19".tr,
                            Text_Hint: "20".tr,
                            icondate: Icons.email_outlined,
                            mycontroller: controller.email),
                        const SizedBox(
                          height: 30,
                        ),
                        GetBuilder<Signincontrollerimp>(
                          builder: (context) => Customeformfaildauth(
                              onTapicon: () {
                                controller.show_password();
                              },
                              hide_text: controller.isshowpassword,
                              Isnumber: false,
                              valid: (val) {
                                return validInput(val!, 8, 30, "passwod");
                              },
                              Text_Label: "21".tr,
                              Text_Hint: "22".tr,
                              icondate: controller.isshowpassword
                                  ? Icons.visibility_off_outlined
                                  : Icons.visibility_outlined,
                              mycontroller: controller.password),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        ForgetBtn(
                          onPressed: () {
                            controller.go_to_forget_pass();
                          },
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Row(
                          children: [
                            Expanded(
                              flex: 1,
                              child: Container(
                                decoration: BoxDecoration(
                                    color: Theme.of(context)
                                        .scaffoldBackgroundColor,
                                    borderRadius: BorderRadius.circular(5)),
                                height: 50,
                                width: 50,
                                child: IconButton(
                                    onPressed: () {
                                      controller.initial_fingerprint(0);
                                    },
                                    icon: Icon(
                                      Icons.fingerprint,
                                      size: 43,
                                    )),
                              ),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Expanded(
                              flex: 3,
                              child: AuthCustomeBtn(
                                Btn_Text: "14".tr,
                                onPressed: () {
                                  controller.login();
                                },
                                Btn_Color: AppColors.primary_color,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        CustomTextSignUpOrSignIn(
                          textone: "24".tr,
                          texttwo: "23".tr,
                          Btn_Color: AppColors.primary_color,
                          onTap: () {
                            controller.go_to_signup_page();
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ));
  }
}
