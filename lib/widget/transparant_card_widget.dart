import 'package:flutter/material.dart';
import 'package:mmimobile/styles/shadow.dart';

class TransparantCard extends StatelessWidget {
  const TransparantCard(
      {super.key,
      this.width,
      this.height,
      this.childern,
      this.opacity = 0.5,
      this.padding = 12.0,
      this.color = Colors.white});

  final double? width;
  final double? height;
  final List<Widget>? childern;
  final double? opacity;
  final double? padding;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      padding: EdgeInsets.all(padding!),
      decoration: BoxDecoration(
          boxShadow: boxShadow,
          color: color!.withValues(alpha: opacity),
          borderRadius: BorderRadius.circular(10.0)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: childern!,
      ),
    );
  }
}
