
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:testapp/controller/auth/forgetpassword/success-signup-controller.dart';
import 'package:testapp/core/constant/colors.dart';
import 'package:testapp/core/constant/imageasset.dart';
import 'package:testapp/views/widgets/auth/auth_custome_btn.dart';
import 'package:testapp/views/widgets/auth/auth_signin_image.dart';
import 'package:testapp/views/widgets/auth/customebodylinetext.dart';
import 'package:testapp/views/widgets/auth/customeheadlinetext.dart';


class Successsignup extends StatelessWidget {
  const Successsignup({super.key});

  @override
  Widget build(BuildContext context) {
    SuccessSignupControllerimp controller =
        Get.put(SuccessSignupControllerimp());
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        title: Text(
          "45".tr,
          style: Theme.of(context)
              .textTheme
              .headlineSmall!
              .copyWith(color: AppColors.grey),
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
                    Headline_Text: "45".tr,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Customebodylinetext(Body_Txet: "50".tr),
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
