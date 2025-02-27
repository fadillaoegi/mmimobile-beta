import 'package:flutter/material.dart';
import 'package:mmimobile/app/styles/fonts.dart';

class SectionTittle extends StatelessWidget {
  const SectionTittle({
    super.key,
    this.title,
    this.onTap,
    this.size = 14.0,
    this.seeMoreActive = false,
    // this.textStyle = black700,
  });

  final String? title;
  final VoidCallback? onTap;
  final double size;
  final bool seeMoreActive;
  // final TextStyle textStyle;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title?.isNotEmpty == true ? title! : "Question?",
          style: black700.copyWith(fontSize: size),
        ),
        seeMoreActive
            ? TextButton(
                onPressed: onTap,
                child: Text(
                  "See Others",
                  style: secondary400.copyWith(fontSize: size - 2),
                ),
              )
            : const SizedBox(),
      ],
    );
  }
}
