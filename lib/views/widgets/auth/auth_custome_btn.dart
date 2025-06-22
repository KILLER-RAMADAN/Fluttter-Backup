import 'package:flutter/material.dart';

class AuthCustomeBtn extends StatelessWidget {
  final Function()? onPressed;
  final String Btn_Text;
  final Color Btn_Color;
  const AuthCustomeBtn(
      {super.key,
      this.onPressed,
      required this.Btn_Text,
      required this.Btn_Color});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.all(Radius.circular(20)),
      child: MaterialButton(
        height: 50,
        padding: EdgeInsets.symmetric(horizontal: 50, vertical: 3),
        onPressed: onPressed,
        child: Text(
          textAlign: TextAlign.center,
          Btn_Text,
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 20, color: Colors.white),
        ),
        color: Btn_Color,
      ),
    );
  }
}
