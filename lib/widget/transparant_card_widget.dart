import 'package:flutter/material.dart';
import 'package:mmimobile/styles/shadow.dart';

class TransparantCard extends StatelessWidget {
  const TransparantCard(
      {super.key, this.sizeScreen, this.childern, this.opacity = 0.5});

  final Size? sizeScreen;
  final List<Widget>? childern;
  final double? opacity;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: sizeScreen!.width,
      padding: const EdgeInsets.all(12.0),
      decoration: BoxDecoration(
          boxShadow: boxShadow,
          color: Colors.white.withOpacity(opacity!),
          borderRadius: BorderRadius.circular(10.0)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: childern!,
      ),
    );
  }
}
