import 'package:flutter/material.dart';
import 'package:mmimobile/app/styles/fonts.dart';

class SectionTittle extends StatelessWidget {
  const SectionTittle({
    super.key,
    this.title,
    this.onTap,
    this.size = 14.0,
    // this.textStyle = black700,
  });

  final String? title;
  final VoidCallback? onTap;
  final double size;
  // final TextStyle textStyle;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title?.isNotEmpty == true ? title! : "Question?",
          style: black700.copyWith(fontSize: 16.0),
        ),
        TextButton(
          onPressed: onTap,
          child: Text(
            "See Others",
            style: primary400.copyWith(fontSize: size),
          ),
        ),
      ],
    );
  }
}
