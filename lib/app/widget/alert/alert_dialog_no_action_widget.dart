import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:mmimobile/app/styles/fonts.dart';

class AlertDialogNoAction extends StatelessWidget {
  const AlertDialogNoAction(
      {super.key,
      this.icon,
      this.title = "",
      this.content = "",
      this.colorIcon,
      this.lotties = ""});

  final IconData? icon;
  final String? title;
  final String? content;
  final Color? colorIcon;
  final String? lotties;
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          icon == null && lotties == ""
              ? const SizedBox()
              : icon != null && lotties == ""
                  ? Icon(
                      icon,
                      color: colorIcon,
                      size: 80.0,
                    )
                  : Lottie.asset(
                      lotties!,
                      width: 80.0,
                      height: 80.0,
                    ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20.0),
            child: Column(
              children: [
                Text(
                  title!,
                  textAlign: TextAlign.center,
                  style: black500.copyWith(fontSize: 22.0),
                ),
                const SizedBox(
                  height: 6.0,
                ),
                Text(
                  content!,
                  textAlign: TextAlign.center,
                  style: black500.copyWith(fontSize: 16.0),
                ),
              ],
            ),
          ),
        ],
      ),
      scrollable: true,
    );
  }
}
