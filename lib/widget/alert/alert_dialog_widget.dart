import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:mmimobile/styles/fonts.dart';
import 'package:mmimobile/widget/button/btn_apps_widget.dart';
import 'package:mmimobile/widget/out_btn_apps_widget.dart';

class AlertDialogApps extends StatelessWidget {
  const AlertDialogApps(
      {super.key,
      this.icon,
      this.title = "",
      this.content = "",
      this.onTap,
      this.colorIcon,
      this.textBtn = "",
      this.lotties = ""});

  final IconData? icon;
  final String? lotties;
  final String? title;
  final String? content;
  final String? textBtn;
  final VoidCallback? onTap;
  final Color? colorIcon;

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
                      width: 120.0,
                      height: 120.0,
                    ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20.0),
            child: Column(
              children: [
                Text(
                  title!,
                  textAlign: TextAlign.center,
                  style: black500.copyWith(fontSize: 20.0),
                ),
                const SizedBox(
                  height: 6.0,
                ),
                Text(
                  content!,
                  textAlign: TextAlign.center,
                  style: black500.copyWith(fontSize: 14.0),
                ),
              ],
            ),
          ),
          Row(
            children: [
              Expanded(
                  child: BtnApps(
                onPress: () {
                  Navigator.pop(context);
                },
                text: "Tidak",
              )),
              const SizedBox(
                width: 8.0,
              ),
              Expanded(
                  child: OutBtnApps(
                text: textBtn,
                onPress: onTap,
              ))
            ],
          )
        ],
      ),
      scrollable: true,
    );
  }
}
