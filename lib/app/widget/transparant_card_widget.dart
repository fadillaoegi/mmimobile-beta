import 'package:flutter/material.dart';
import 'package:mmimobile/app/styles/shadow.dart';

class CardFLdev extends StatelessWidget {
  const CardFLdev({
    super.key,
    this.width,
    this.height,
    this.child,
    this.radius = 10.0,
    this.padding = 12.0,
    this.margin = 0.0,
    this.color = Colors.white,
  });

  final double? width;
  final double? height;
  final double? radius;
  final double? padding;
  final double? margin;
  final Color? color;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Container(
        width: width,
        height: height,
        padding: EdgeInsets.all(padding!),
        margin: EdgeInsets.all(margin!),
        decoration: BoxDecoration(
            boxShadow: boxShadow,
            color: color!,
            borderRadius: BorderRadius.circular(radius!)),
        child: child!);
  }
}
