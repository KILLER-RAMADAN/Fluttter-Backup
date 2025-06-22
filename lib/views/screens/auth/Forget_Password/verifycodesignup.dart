
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:otp_text_field_v2/otp_field_v2.dart';
import 'package:testapp/controller/auth/forgetpassword/verifycode-signup-controller.dart';
import 'package:testapp/core/class/handlingdataview.dart';
import 'package:testapp/core/constant/colors.dart';
import 'package:testapp/core/constant/imageasset.dart';
import 'package:testapp/core/functions/alert.dart';
import 'package:testapp/views/widgets/auth/auth_signin_image.dart';
import 'package:testapp/views/widgets/auth/customebodylinetext.dart';
import 'package:testapp/views/widgets/auth/customeheadlinetext.dart';



class Verifycodesignup extends StatelessWidget {
  const Verifycodesignup({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(Verifysignupcontrollerimp());
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.white,
          title: Text(
            "36".tr,
            style: Theme.of(context)
                .textTheme
                .headlineSmall!
                .copyWith(color: AppColors.grey),
          ),
          elevation: 0.0,
        ),
        body: GetBuilder<Verifysignupcontrollerimp>(
          builder: (controller) => SafeArea(
              child: HandlingDataViewRequest(
            statusRequest: controller.statusRequest,
            widget: PopScope(
              canPop: false,
              onPopInvoked: (didPop) {
                exitalert();
              },
              child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                  child: ListView(
                    children: [
                      AuthSigninImage(
                          imag_height: 150, head_iamg: AppImage.verify_code),
                      Customeheadlinetext(
                        Headline_Text: "37".tr,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Customebodylinetext(Body_Txet: "38".tr),
                      const SizedBox(
                        height: 30,
                      ),
                      OTPTextFieldV2(
                        length: 5,
                        width: MediaQuery.of(context).size.width,
                        textFieldAlignment: MainAxisAlignment.spaceAround,
                        fieldWidth: 45,
                        textDirection: TextDirection.ltr,
                        outlineBorderRadius: 15,
                        style: TextStyle(fontSize: 17),
                        onCompleted: (pin) {
                          controller.check_code(pin);
                        },
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      // AuthCustomeBtn(
                      //   Btn_Text: "Check Code ".tr,
                      //   onPressed: () {
                      //     Get.toNamed(AppRoutes.resetpass);
                      //   },
                      //   Btn_Color: AppColors.primary_color,
                      // ),
                      SizedBox(
                        height: 15,
                      ),
                    ],
                  )),
            ),
          )),
        ));
  }
}
