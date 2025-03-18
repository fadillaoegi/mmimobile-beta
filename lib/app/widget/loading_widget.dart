import 'package:flutter/cupertino.dart';
import 'package:mmimobile/app/styles/color.dart';

class LoadingApps extends StatelessWidget {
  const LoadingApps({super.key, this.radius = 14.0});

  final double? radius;

  @override
  Widget build(BuildContext context) {
    return CupertinoActivityIndicator(
      radius: radius!,
      color: ColorApps.secondary,
      animating: true,
    );
  }
}
