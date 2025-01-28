import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:mmimobile/app/styles/color.dart';
import 'package:mmimobile/app/styles/fonts.dart';
import 'package:mmimobile/app/widget/button/btn_out_apps_widget.dart';

class AlertFormPass extends StatelessWidget {
  const AlertFormPass(
      {super.key,
      this.onTap,
      this.onTapSuffix,
      this.controller,
      this.btnTitle = '',
      this.validator,
      this.obscureText});
  final String? btnTitle;
  final VoidCallback? onTap;
  final VoidCallback? onTapSuffix;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final bool? obscureText;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      scrollable: true,
      content: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                GestureDetector(
                  onTap: () => Get.back(),
                  child: Icon(
                    Icons.close,
                    size: 22.0,
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 20.0,
            ),
            Text(
              "Please, enter your password",
              style: black400,
            ),
            const SizedBox(
              height: 10.0,
            ),
            TextFormField(
              validator: validator,
              controller: controller,
              obscureText: obscureText!,
              decoration: InputDecoration(
                suffixIcon: InkWell(
                  onTap: onTapSuffix,
                  child: Icon(
                    obscureText!
                        ? Icons.visibility_outlined
                        : Icons.visibility_off_outlined,
                    color: ColorApps.icon,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20.0,
            ),
            OutBtnApps(
              onPress: onTap,
              text: btnTitle!.isNotEmpty ? btnTitle : "Update",
            )
          ],
        ),
      ),
    );
  }
}
