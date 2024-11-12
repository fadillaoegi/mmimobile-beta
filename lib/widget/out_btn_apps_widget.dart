import 'package:flutter/material.dart';
import 'package:mmimobile/styles/color.dart';
import 'package:mmimobile/styles/fonts.dart';

class OutBtnApps extends StatelessWidget {
  const OutBtnApps(
      {super.key,
      this.onPress,
      this.text = "",
      this.color,
      this.sizeText = 14.0});

  final VoidCallback? onPress;
  final String? text;
  final Color? color;
  final double? sizeText;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      child: Container(
        width: double.infinity,
        height: 50.0,
        decoration: BoxDecoration(
            border: Border.all(color: ColorApps.primary),
            borderRadius: BorderRadius.circular(10.0)),
        child: Center(
          child: Text(
            text!,
            textAlign: TextAlign.center,
            style: primary500.copyWith(fontSize: sizeText),
          ),
        ),
      ),
    );
  }
}
