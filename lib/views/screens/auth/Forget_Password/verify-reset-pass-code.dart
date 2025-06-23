import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:otp_text_field_v2/otp_field_style_v2.dart';
import 'package:otp_text_field_v2/otp_field_v2.dart';
import 'package:testapp/controller/auth/forgetpassword/forget_passwordcontroller.dart';
import 'package:testapp/controller/auth/forgetpassword/verifycode-reset-controller.dart';
import 'package:testapp/core/class/handlingdataview.dart';
import 'package:testapp/core/constant/colors.dart';
import 'package:testapp/core/constant/imageasset.dart';
import 'package:testapp/core/functions/alert.dart';
import 'package:testapp/views/widgets/auth/auth_signin_image.dart';
import 'package:testapp/views/widgets/auth/customebodylinetext.dart';
import 'package:testapp/views/widgets/auth/customeheadlinetext.dart';

class Verifypassword extends StatelessWidget {
  const Verifypassword({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(Verifycodecontrollerimp());
    Forgetpasscontrollerimp forgetpass = Get.put(Forgetpasscontrollerimp());

    return Scaffold(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          title: Text(
            "36".tr,
            style: Theme.of(context)
                .textTheme
                .headlineSmall!
                .copyWith(color: AppColors.grey),
          ),
          elevation: 0.0,
        ),
        body: GetBuilder<Verifycodecontrollerimp>(
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
                        otpFieldStyle: OtpFieldStyle(
                          focusBorderColor: AppColors.primary_color,
                          enabledBorderColor: AppColors.primary_color,
                          errorBorderColor: Colors.red,
                        ),
                        length: 5,
                        width: MediaQuery.of(context).size.width,
                        textFieldAlignment: MainAxisAlignment.spaceAround,
                        fieldWidth: 45,
                        fieldStyle: FieldStyle.box,
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
                      MaterialButton(
                        onPressed: () {
                          forgetpass.check_email();
                          Get.rawSnackbar(
                              title: "85".tr,
                              messageText: Text(
                                "82".tr,
                                style: TextStyle(color: AppColors.white),
                              ));
                        },
                        splashColor: Colors.transparent,
                        child: Container(
                            width: 160,
                            height: 40,
                            decoration: BoxDecoration(
                                color: AppColors.fourth_color,
                                borderRadius: BorderRadius.circular(10)),
                            child: Center(
                              child: Text(
                                "81".tr,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: AppColors.white, fontSize: 20),
                              ),
                            )),
                      ),
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
