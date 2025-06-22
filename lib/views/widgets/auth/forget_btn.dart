
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:testapp/core/constant/colors.dart';


class ForgetBtn extends StatelessWidget {
  final void Function()? onPressed;
  const ForgetBtn({super.key, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      hoverElevation: 0.0,
      highlightElevation: 0.0,
      hoverColor: Colors.white,
      splashColor: Colors.transparent,
      onPressed: onPressed,
      child: Text("17".tr,
          textAlign: TextAlign.center,
          style: TextStyle(color: AppColors.grey, fontWeight: FontWeight.bold)),
    );
  }
}
