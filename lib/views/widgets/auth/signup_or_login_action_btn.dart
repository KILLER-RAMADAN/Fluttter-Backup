import 'package:flutter/material.dart';

class CustomTextSignUpOrSignIn extends StatelessWidget {
  final String textone;
  final String texttwo;
  final void Function() onTap;
  final Color Btn_Color;
  const CustomTextSignUpOrSignIn(
      {Key? key,
      required this.textone,
      required this.texttwo,
      required this.onTap,
      required this.Btn_Color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          textone,
          style: TextStyle(
            color: Theme.of(context).textTheme.bodySmall!.color,
          ),
        ),
        InkWell(
          onTap: onTap,
          child: Text(texttwo,
              style: TextStyle(color: Btn_Color, fontWeight: FontWeight.bold)),
        )
      ],
    );
  }
}
