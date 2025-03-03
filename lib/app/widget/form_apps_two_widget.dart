import 'package:flutter/material.dart';
import 'package:mmimobile/app/styles/color.dart';
import 'package:mmimobile/app/styles/fonts.dart';

class FormAppsTwo extends StatelessWidget {
  const FormAppsTwo({
    super.key,
    this.controller,
    this.obscure = false,
    this.labelText = "",
    this.validator,
    this.enabled = true,
    this.suffixIcon = false,
    this.maxLines = 1,
    this.onTap,
    this.keybooardType = TextInputType.emailAddress,
  });

  final TextEditingController? controller;
  final bool obscure;
  final bool enabled;
  final int maxLines;
  final bool suffixIcon;
  final String labelText;
  final String? Function(String?)? validator;
  final VoidCallback? onTap;
  final TextInputType? keybooardType;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      maxLines: maxLines,
      controller: controller,
      enabled: enabled,
      obscureText: obscure,
      keyboardType: keybooardType,
      autofocus: false,
      decoration: InputDecoration(
          labelText: labelText,
          labelStyle: black400.copyWith(fontSize: 13.0),
          suffixIcon: suffixIcon
              ? InkWell(
                  onTap: onTap,
                  child: Icon(
                    obscure
                        ? Icons.visibility_outlined
                        : Icons.visibility_off_outlined,
                    color: ColorApps.icon,
                  ),
                )
              : const SizedBox(),
          border: const OutlineInputBorder(
              borderSide: BorderSide(color: ColorApps.primary),
              borderRadius: BorderRadius.all(Radius.circular(10.0))),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: ColorApps.secondary, width: 2.0),
          )),
    );
  }
}
