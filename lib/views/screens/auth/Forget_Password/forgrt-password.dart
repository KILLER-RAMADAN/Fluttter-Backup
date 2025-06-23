
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:testapp/controller/auth/forgetpassword/forget_passwordcontroller.dart';
import 'package:testapp/core/constant/colors.dart';
import 'package:testapp/core/constant/imageasset.dart';
import 'package:testapp/core/functions/valid_input.dart';
import 'package:testapp/views/widgets/auth/auth_signin_image.dart';
import 'package:testapp/views/widgets/auth/customebodylinetext.dart';
import 'package:testapp/views/widgets/auth/customeformfaildauth.dart';
import 'package:testapp/views/widgets/auth/customeheadlinetext.dart';


import '../../../../core/class/handlingdataview.dart';
import '../../../widgets/auth/auth_custome_btn.dart';

class ForgrtPassword extends StatelessWidget {
  const ForgrtPassword({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(Forgetpasscontrollerimp());

    return Scaffold(
        backgroundColor:Theme.of(context).scaffoldBackgroundColor,
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          title: Text(
            "35".tr,
            style:
                TextStyle(color: AppColors.grey, fontWeight: FontWeight.bold),
          ),
          elevation: 0.0,
        ),
        body: GetBuilder<Forgetpasscontrollerimp>(
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
                          imag_height: 150, head_iamg: AppImage.verify_Image),
                      Customeheadlinetext(
                        Headline_Text: "32".tr,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Customebodylinetext(Body_Txet: "33".tr),
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
                          mycontroller: controller.checkemail),
                      const SizedBox(
                        height: 30,
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      AuthCustomeBtn(
                        Btn_Text: "34".tr,
                        onPressed: () {
                          controller.check_email();
                        },
                        Btn_Color: AppColors.primary_color,
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      // CustomTextSignUpOrSignIn(
                      //   textone: "24".tr,
                      //   texttwo: "23".tr,
                      //   Btn_Color: AppColors.primary_color,
                      //   onTap: () {
                      //     forgetpasscontroller.go_to_signup();
                      //   },
                      // ),
                    ],
                  ),
                )),
          )),
        ));
  }
}
