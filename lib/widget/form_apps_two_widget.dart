import 'package:flutter/material.dart';
import 'package:mmimobile/styles/color.dart';
import 'package:mmimobile/styles/fonts.dart';

class FormAppsTwo extends StatelessWidget {
  const FormAppsTwo({
    super.key,
    this.controller,
    this.obscure = false,
    this.labelText = "",
    this.validator,
    this.enabled = true,
    this.suffixIcon = false,
    this.onTap,
  });

  final TextEditingController? controller;
  final bool obscure;
  final bool enabled;
  final bool suffixIcon;
  final String labelText;
  final String? Function(String?)? validator;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      controller: controller,
      enabled: enabled,
      obscureText: obscure,
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
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: ColorApps.primary, width: 2.0),
          )),
    );
  }
}
