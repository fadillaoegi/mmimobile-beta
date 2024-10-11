import 'package:flutter/material.dart';
import 'package:mmimobile/styles/color.dart';
import 'package:mmimobile/styles/fonts.dart';

class FormApps extends StatelessWidget {
  const FormApps({
    super.key,
    this.controller,
    this.hint,
    this.textInput,
    this.keys,
    this.maxLines = 1,
    this.activeSuffix = false,
    this.onTapSuffix,
    this.onChange,
    this.validator,
    this.obsecure = false,
    this.iconSuffix,
  });
  final TextEditingController? controller;
  final String? hint;
  final TextInputType? textInput;
  final Key? keys;
  final Function(String)? onChange;
  final int? maxLines;
  final bool? activeSuffix;
  final VoidCallback? onTapSuffix;
  final String? Function(String?)? validator;
  final bool? obsecure;
  final IconData? iconSuffix;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      maxLines: maxLines,
      onChanged: onChange,
      obscureText: obsecure!,
      key: keys,
      controller: controller,
      keyboardType: textInput,
      decoration: InputDecoration(
        hintText: hint,
        focusColor: ColorApps.primary,
        counterStyle: const TextStyle(color: ColorApps.primary),
        focusedBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: ColorApps.primary, width: 2.0)),
        fillColor: ColorApps.black,
        hintStyle: disable500.copyWith(fontSize: 14.0),
        suffix: activeSuffix!
            ? Padding(
                padding: const EdgeInsets.only(right: 20.0),
                child: InkWell(
                  onTap: onTapSuffix,
                  child: obsecure!
                      ? const Icon(
                          Icons.visibility,
                          color: ColorApps.primary,
                          size: 26.0,
                        )
                      : const Icon(
                          Icons.visibility_off,
                          color: ColorApps.primary,
                          size: 26.0,
                        ),
                ),
              )
            : const SizedBox(),
      ),
    );
  }
}
