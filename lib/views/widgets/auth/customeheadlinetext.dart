import 'package:flutter/material.dart';

class Customeheadlinetext extends StatelessWidget {
  final String Headline_Text;
  const Customeheadlinetext({super.key, required this.Headline_Text});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(Headline_Text,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.headlineMedium!),
    );
  }
}
