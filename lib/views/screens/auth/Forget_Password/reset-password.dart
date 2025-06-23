import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:testapp/controller/auth/forgetpassword/resetpassword-controller.dart';
import 'package:testapp/core/class/handlingdataview.dart';
import 'package:testapp/core/constant/colors.dart';
import 'package:testapp/core/constant/imageasset.dart';
import 'package:testapp/core/functions/alert.dart';
import 'package:testapp/core/functions/valid_input.dart';
import 'package:testapp/views/widgets/auth/auth_custome_btn.dart';
import 'package:testapp/views/widgets/auth/auth_signin_image.dart';
import 'package:testapp/views/widgets/auth/customebodylinetext.dart';
import 'package:testapp/views/widgets/auth/customeformfaildauth.dart';
import 'package:testapp/views/widgets/auth/customeheadlinetext.dart';

class ResetPassword extends StatelessWidget {
  const ResetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(Resetpasswordcontrollerimp());
    return Scaffold(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          title: Text(
            "39".tr,
            style:
                TextStyle(color: AppColors.grey, fontWeight: FontWeight.bold),
          ),
          elevation: 0.0,
        ),
        body: GetBuilder<Resetpasswordcontrollerimp>(
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
                  child: Form(
                    key: controller.formstate,
                    child: ListView(
                      children: [
                        AuthSigninImage(
                            imag_height: 150, head_iamg: AppImage.reset_code),
                        Customeheadlinetext(
                          Headline_Text: "40".tr,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Customebodylinetext(Body_Txet: "41".tr),
                        const SizedBox(
                          height: 30,
                        ),
                        GetBuilder<Resetpasswordcontrollerimp>(
                          builder: (context) => Customeformfaildauth(
                              onTapicon: () {
                                controller.showpassword();
                              },
                              hide_text: controller.isshowpassword,
                              Isnumber: false,
                              valid: (val) {
                                return validInput(val!, 8, 20, "42".tr);
                              },
                              Text_Label: "42".tr,
                              Text_Hint: "40".tr,
                              icondate: null,
                              mycontroller: controller.mainpass),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        GetBuilder<Resetpasswordcontrollerimp>(
                          builder: (context) => Customeformfaildauth(
                              onTapicon: () {
                                controller.showpassword();
                              },
                              hide_text: controller.isshowpassword,
                              Isnumber: false,
                              valid: (val) {
                                return validInput(val!, 8, 20, "42".tr);
                              },
                              Text_Label: "43".tr,
                              Text_Hint: "43".tr,
                              icondate: controller.isshowpassword
                                  ? Icons.visibility_off_outlined
                                  : Icons.visibility_outlined,
                              mycontroller: controller.repass),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        AuthCustomeBtn(
                          Btn_Text: "44".tr,
                          onPressed: () {
                            controller.ResetPassword();
                          },
                          Btn_Color: AppColors.primary_color,
                        ),
                        SizedBox(
                          height: 15,
                        ),
                      ],
                    ),
                  )),
            ),
          )),
        ));
  }
}
