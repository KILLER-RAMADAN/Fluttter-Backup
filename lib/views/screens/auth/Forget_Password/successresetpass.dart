
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:testapp/controller/auth/forgetpassword/success-reset-pass-controller.dart';
import 'package:testapp/core/constant/colors.dart';
import 'package:testapp/core/constant/imageasset.dart';
import 'package:testapp/views/widgets/auth/auth_custome_btn.dart';
import 'package:testapp/views/widgets/auth/auth_signin_image.dart';
import 'package:testapp/views/widgets/auth/customebodylinetext.dart';
import 'package:testapp/views/widgets/auth/customeheadlinetext.dart';

class Successresetpass extends StatelessWidget {
  const Successresetpass({super.key});

  @override
  Widget build(BuildContext context) {
    SuccessResetPassControllerimp controller =
        Get.put(SuccessResetPassControllerimp());

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        title: Text(
          "46".tr,
          style: TextStyle(color: AppColors.grey, fontWeight: FontWeight.bold),
        ),
        elevation: 0.0,
      ),
      body: SafeArea(
          child: Container(
              padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
              child: ListView(
                children: [
                  AuthSigninImage(
                      imag_height: 150, head_iamg: AppImage.Success_image),
                  Customeheadlinetext(
                    Headline_Text: "46".tr,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Customebodylinetext(Body_Txet: "49".tr),
                  const SizedBox(
                    height: 30,
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  AuthCustomeBtn(
                    Btn_Text: "48".tr,
                    onPressed: () {
                      controller.Go_to_Login_Page();
                    },
                    Btn_Color: AppColors.primary_color,
                  ),
                  SizedBox(
                    height: 15,
                  ),
                ],
              ))),
    );
  }
}
