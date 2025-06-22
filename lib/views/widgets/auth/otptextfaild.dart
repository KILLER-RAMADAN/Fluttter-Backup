
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:testapp/core/constant/colors.dart';


class otp_text_feild extends StatelessWidget {
  final void Function(String)? onSubmit;
  const otp_text_feild({super.key, this.onSubmit});

  @override
  Widget build(BuildContext context) {
    return OtpTextField(
      numberOfFields: 5,
      fieldWidth: 50,
      fillColor: AppColors.primary_color,
      borderRadius: BorderRadius.all(Radius.circular(15)),
      borderColor: Color(0xFF512DA8),
      //set to true to show as box or false to show as dash
      showFieldAsBox: true,
      //runs when a code is typed in
      onCodeChanged: (String code) {
        //handle validation or checks here
      },
      //runs when every textfield is filled
      onSubmit: onSubmit, // end onSubmit
    );
  }
}
