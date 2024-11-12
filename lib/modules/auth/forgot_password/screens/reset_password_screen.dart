import 'package:flutter/material.dart';
import 'package:mmimobile/configs/asset_config.dart';
import 'package:mmimobile/styles/color.dart';
import 'package:mmimobile/styles/fonts.dart';
import 'package:mmimobile/widget/btn_apps_widget.dart';
import 'package:mmimobile/widget/form_apps_two_widget.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({super.key});

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  final _passController = TextEditingController();
  final _confirmPassController = TextEditingController();
  bool _isObsecure = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) => SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(minHeight: constraints.maxHeight),
            child: Padding(
              padding: const EdgeInsets.all(22.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 30.0, bottom: 20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: const Icon(
                            Icons.arrow_back,
                            color: ColorApps.primary,
                          ),
                        )
                      ],
                    ),
                  ),
                  Center(
                    child: Image.asset(
                      AssetConfig.logo3,
                      height: 50.0,
                    ),
                  ),
                  const SizedBox(
                    height: 40.0,
                  ),
                  Text(
                    "Reset Your Password",
                    style: primary600.copyWith(fontSize: 16.0),
                  ),
                  const SizedBox(
                    height: 18.0,
                  ),
                  Text(
                    "Password must be different than before",
                    textAlign: TextAlign.center,
                    style: black400.copyWith(fontSize: 13.0),
                  ),
                  const SizedBox(
                    height: 18.0,
                  ),
                  FormAppsTwo(
                    controller: _passController,
                    labelText: "Password",
                    obscure: _isObsecure,
                    suffixIcon: true,
                    onTap: () {
                      setState(() {
                        _isObsecure = !_isObsecure;
                      });
                    },
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  FormAppsTwo(
                    controller: _confirmPassController,
                    labelText: "Confirm Password",
                    obscure: _isObsecure,
                    suffixIcon: true,
                    onTap: () {
                      setState(() {
                        _isObsecure = !_isObsecure;
                      });
                    },
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  BtnApps(
                    onPress: () {},
                    text: "Reset Password",
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
