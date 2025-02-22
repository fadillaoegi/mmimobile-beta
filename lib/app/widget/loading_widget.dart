import 'package:flutter/cupertino.dart';
import 'package:mmimobile/app/styles/color.dart';

class LoadingApps extends StatelessWidget {
  const LoadingApps({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoActivityIndicator(
      radius: 14.0,
      color: ColorApps.secondary,
      animating: true,
    );
  }
}
