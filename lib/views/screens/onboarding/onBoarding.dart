import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:testapp/controller/onboarding/on-boarding-controller.dart';
import 'package:testapp/views/widgets/onboarding/custome_button.dart';
import 'package:testapp/views/widgets/onboarding/onboarder_animated_controller.dart';
import 'package:testapp/views/widgets/onboarding/page_view.dart';
import 'package:testapp/views/widgets/onboarding/skip_button.dart';

class onBoarding extends StatelessWidget {
  const onBoarding({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(On_Boarding_imp());
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: SafeArea(
          child: const Column(
        children: const [
          Expanded(flex: 3, child: full_on_boarding_page_view()),
          Expanded(
            flex: 1,
            child: const Column(
              children: const [
                custome_controller_on_boader(),
                SizedBox(
                  height: 20,
                ),
                Custome_Button_on_Boarding(),
                Skip_Button_on_Boarding()
              ],
            ),
          )
        ],
      )),
    );
  }
}
