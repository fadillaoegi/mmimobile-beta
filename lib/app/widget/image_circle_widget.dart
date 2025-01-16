import 'package:flutter/material.dart';
import 'package:mmimobile/app/configs/asset_config.dart';

class ImageCircle extends StatelessWidget {
  const ImageCircle({super.key, this.size = 60.0});

  final double? size;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: size,
      width: size,
      child: const CircleAvatar(
        backgroundImage: AssetImage(
          AssetConfig.logo,
        ),
      ),
    );
  }
}
