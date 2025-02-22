import 'package:flutter/material.dart';
import 'package:mmimobile/app/styles/fonts.dart';

class SectionTittle extends StatelessWidget {
  const SectionTittle({
    super.key,
    this.title,
    this.onTap,
    this.size = 14.0,
  });
  final String? title;
  final VoidCallback? onTap;
  final double? size;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title == "" ? "Quetion ?" : title.toString(),
          style: black600.copyWith(fontSize: 16.0),
        ),
        TextButton(
            onPressed: onTap,
            child: Text(
              "See Others",
              style: white600.copyWith(fontSize: size),
            ))
      ],
    );
  }
}
