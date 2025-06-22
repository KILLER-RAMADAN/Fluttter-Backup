
import 'package:flutter/material.dart';
import 'package:testapp/core/constant/colors.dart';

class lang_button extends StatelessWidget {
  final String lang_name;
  final void Function()? onPressed;
  const lang_button({super.key, required this.lang_name, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: double.infinity,
      child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        child: MaterialButton(
          padding: EdgeInsets.symmetric(horizontal: 50, vertical: 0),
          onPressed: onPressed,
          child: Text(lang_name,
              style: TextStyle(fontSize: 20, color: AppColors.white)),
          color: AppColors.primary_color,
        ),
      ),
    );
  }
}
