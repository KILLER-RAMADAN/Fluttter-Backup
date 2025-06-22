
import 'package:flutter/material.dart';
import 'package:testapp/core/constant/colors.dart';

class Customebodylinetext extends StatelessWidget {
  final String Body_Txet;
  const Customebodylinetext({super.key, required this.Body_Txet});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        Body_Txet,
        textAlign: TextAlign.center,
        style: Theme.of(context)
            .textTheme
            .headlineLarge!
            .copyWith(fontSize: 18, color: AppColors.grey),
      ),
    );
  }
}
