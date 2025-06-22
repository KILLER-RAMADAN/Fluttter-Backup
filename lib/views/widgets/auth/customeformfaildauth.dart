import 'package:flutter/material.dart';
import 'package:testapp/core/constant/colors.dart';

class Customeformfaildauth extends StatelessWidget {
  final String Text_Label;
  final String Text_Hint;
  final IconData? icondate;
  final TextEditingController? mycontroller;
  final String? Function(String?)? valid;
  final bool Isnumber;
  final bool hide_text;
  final void Function()? onTapicon;

  const Customeformfaildauth(
      {super.key,
      required this.Text_Label,
      required this.Text_Hint,
      this.icondate,
      this.mycontroller,
      required this.valid,
      required this.Isnumber,
      required this.hide_text,
      this.onTapicon});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        validator: valid,
        obscureText: hide_text == false ? false : true,
        controller: mycontroller,
        keyboardType: Isnumber
            ? TextInputType.numberWithOptions(decimal: true)
            : TextInputType.text,
        decoration: InputDecoration(
            hintText: Text_Hint,
            iconColor: AppColors.primary_color,
            hoverColor: AppColors.primary_color,
            focusColor: Colors.blueGrey,
            hintStyle: TextStyle(fontFamily: "Lato", fontSize: 15),
            contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            floatingLabelAlignment: FloatingLabelAlignment.start,
            label: Text(Text_Label),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(5))),
            suffix: InkWell(
              child: Icon(icondate),
              onTap: onTapicon,
            )));
  }
}
