import 'package:flutter/material.dart';

class AuthSigninImage extends StatelessWidget {
  final String head_iamg;
  final double imag_height;

  const AuthSigninImage(
      {super.key,
      required this.head_iamg,
      required this.imag_height});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
  
      head_iamg,
      height: imag_height,
    );
  }
}


class AuthSigninImage1 extends StatelessWidget {
  final String head_iamg;
  final double imag_height;

  const AuthSigninImage1(
      {super.key, required this.head_iamg, required this.imag_height});

  @override
  Widget build(BuildContext context) {
    return Image.network(
      head_iamg,
      height: imag_height,
    );
  }
}
