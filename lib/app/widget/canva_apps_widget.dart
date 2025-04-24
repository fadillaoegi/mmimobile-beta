import 'package:flutter/material.dart';
import 'package:mmimobile/app/styles/color.dart';
import 'package:mmimobile/app/styles/shadow.dart';

class CanvaFLdev extends StatelessWidget {
  const CanvaFLdev({
    super.key,
    this.widget,
    this.bottom = 0.0,
    this.left = 10.0,
    this.right = 10.0,
    this.top = 10.0,
    this.bg = "",
    this.color = ColorApps.white,
  });

  final Widget? widget;
  final double? top;
  final double? bottom;
  final double? right;
  final double? left;
  final String? bg;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    final sizeScreen = MediaQuery.sizeOf(context);

    return Container(
      height: sizeScreen.height,
      width: sizeScreen.width,
      padding: EdgeInsets.only(
          top: top!, bottom: bottom!, left: left!, right: right!),
      decoration: bg!.isNotEmpty
          ? BoxDecoration(
              boxShadow: boxShadow,
              image: DecorationImage(image: AssetImage(bg!), fit: BoxFit.cover))
          : BoxDecoration(
              // color: color,
              color: const Color.fromARGB(33, 158, 158, 158),
            ),
      child:
          Container(margin: const EdgeInsets.only(bottom: 4.0), child: widget),
    );
  }
}
