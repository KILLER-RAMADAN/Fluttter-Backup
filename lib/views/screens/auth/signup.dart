import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl_mobile_field/intl_mobile_field.dart';
import 'package:testapp/controller/auth/signupcontroller.dart';
import 'package:testapp/core/class/handlingdataview.dart';
import 'package:testapp/core/constant/colors.dart';
import 'package:testapp/core/constant/imageasset.dart';
import 'package:testapp/core/functions/valid_input.dart';
import 'package:testapp/views/widgets/auth/auth_custome_btn.dart';
import 'package:testapp/views/widgets/auth/auth_signin_image.dart';
import 'package:testapp/views/widgets/auth/customebodylinetext.dart';
import 'package:testapp/views/widgets/auth/customeformfaildauth.dart';
import 'package:testapp/views/widgets/auth/customeheadlinetext.dart';
import 'package:testapp/views/widgets/auth/forget_btn.dart';

class Signup extends StatelessWidget {
  const Signup({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(Signupcontrollerimp());
    return Scaffold(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          title: Text("24".tr,
              style: TextStyle(
                  color: AppColors.grey, fontWeight: FontWeight.bold)),
          elevation: 0.0,
        ),
        body: GetBuilder<Signupcontrollerimp>(
          builder: (controller) => SafeArea(
              child: HandlingDataViewRequest(
            statusRequest: controller.statusRequest,
            widget: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                child: Form(
                  key: controller.formstate,
                  child: ListView(
                    children: [
                      const AuthSigninImage(
                        imag_height: 100,
                        head_iamg: AppImage.Signup_Image,
                      ),
                      Customeheadlinetext(
                        Headline_Text: '15'.tr,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Customebodylinetext(Body_Txet: "25".tr),
                      const SizedBox(
                        height: 30,
                      ),
                      Customeformfaildauth(
                          hide_text: false,
                          Isnumber: false,
                          valid: (val) {
                            return validInput(val!, 5, 100, "username");
                          },
                          Text_Label: "26".tr,
                          Text_Hint: "27".tr,
                          icondate: Icons.person,
                          mycontroller: controller.username),
                      const SizedBox(
                        height: 20,
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
                        height: 20,
                      ),
                      // Customeformfaildauth(
                      //     hide_text: false,
                      //     Isnumber: true,
                      //     valid: (val) {
                      //       return validInput(val!, 9, 15, "phone");
                      //     },
                      //     Text_Label: "28".tr,
                      //     Text_Hint: "29".tr,
                      //     icondate: Icons.phone_android_outlined,
                      //     mycontroller: controller.phone),

                      IntlMobileField(
                          favorite: const ['EG', 'US', 'SA'],
                          favoriteIcon: Icon(
                            Icons.favorite,
                            color: Colors.red,
                          ),
                          favoriteIconPosition: Position.trailing,
                          favoriteCountryCodePosition: Position.trailing,
                          initialCountryCode: 'EG',
                          languageCode: controller.myservices.sharedPreferences
                                      .getString("lang") ==
                                  "en"
                              ? "en"
                              : "ar", // default is 'en'
                          onCountryChanged: (country) {
                            controller.countrycode.text = country.code;
                            controller.countryname.text = country.name;
                            print('Country code changed to: ${country.code}');
                            print('Country name changed to: ${country.name}');
                            print('Country changed to: ${country.name}');
                          },
                          decoration: InputDecoration(
                            labelText: "29".tr,
                            border: const OutlineInputBorder(
                              borderSide: BorderSide(),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5)),
                            ),
                            prefixIcon:
                                const Icon(Icons.phone_android_outlined),
                          ),
                          disableLengthCounter: false,
                          onChanged: (mobile) {
                            print(mobile.completeNumber);
                            controller.phone.text = mobile.completeNumber;
                          },
                          validator: (mobileNumber) {
                            if (mobileNumber == null ||
                                mobileNumber.number.isEmpty) {
                              return '53'.tr;
                            }
                            if (!RegExp(r'^[0-9]+$')
                                .hasMatch(mobileNumber.number)) {
                              return "196".tr;
                            }
                            return null;
                          }),
                      SizedBox(
                        height: 20,
                      ),
                      GetBuilder<Signupcontrollerimp>(
                        builder: (context) => Customeformfaildauth(
                            onTapicon: () {
                              controller.show_password();
                            },
                            hide_text: controller.isshowpassword,
                            Isnumber: false,
                            valid: (val) {
                              return validInput(val!, 8, 30, "password");
                            },
                            Text_Label: "21".tr,
                            Text_Hint: "22".tr,
                            icondate: controller.isshowpassword
                                ? Icons.visibility_off_outlined
                                : Icons.visibility_outlined,
                            mycontroller: controller.password),
                      ),
                      ForgetBtn(
                        onPressed: () {
                          controller.go_to_forget_pass();
                        },
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      AuthCustomeBtn(
                        Btn_Text: "18".tr,
                        onPressed: () {
                          controller.signup();
                        },
                        Btn_Color: Colors.deepOrangeAccent,
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      // CustomTextSignUpOrSignIn(
                      //   textone: "30".tr,
                      //   texttwo: "31".tr,
                      //   Btn_Color: Colors.deepOrangeAccent,
                      //   onTap: () {
                      //     signup_controller.go_to_signin_page();
                      //   },
                      // ),
                    ],
                  ),
                )),
          )),
        ));
  }
}
