import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:testapp/controller/onboarding/on-boarding-controller.dart';

class Skip_Button_on_Boarding extends GetView<On_Boarding_imp> {
  const Skip_Button_on_Boarding({super.key});

  @override
  Widget build(BuildContext context) {
    On_Boarding_imp cotroller = On_Boarding_imp();
    return Container(
      height: 40,
      margin: EdgeInsets.only(bottom: 30),
      child: MaterialButton(
        padding: EdgeInsets.symmetric(horizontal: 60, vertical: 0),
        onPressed: () {
          cotroller.skip_btn();
        },
        textColor: Theme.of(context).textTheme.bodyLarge!.color,
        child: Text(
          "13".tr,
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
