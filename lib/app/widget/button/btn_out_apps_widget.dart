import 'package:flutter/material.dart';
import 'package:mmimobile/app/styles/color.dart';
import 'package:mmimobile/app/styles/fonts.dart';

class OutBtnApps extends StatelessWidget {
  const OutBtnApps(
      {super.key, this.onPress, this.text = "Daftar", this.sizeText = 14.0});

  final VoidCallback? onPress;
  final String? text;
  final double? sizeText;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: double.infinity,
        child: OutlinedButton(
            onPressed: onPress,
            style: OutlinedButton.styleFrom(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0)),
              side: const BorderSide(color: ColorApps.primary),
            ),
            child: Text(
              text!,
              style: primary600.copyWith(fontSize: sizeText),
            )));
  }
}
