import 'package:flutter/material.dart';
import 'package:mmimobile/modules/phone_edit/providers/phone_edit_provider.dart';
import 'package:mmimobile/styles/color.dart';
import 'package:mmimobile/styles/fonts.dart';
import 'package:mmimobile/styles/shadow.dart';
import 'package:mmimobile/widget/button/btn_apps_widget.dart';
import 'package:mmimobile/widget/form_apps_two_widget.dart';
import 'package:provider/provider.dart';

class PhoneEditScreen extends StatelessWidget {
  const PhoneEditScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final phoneEditP = Provider.of<PhoneEditProvider>(context);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Edit Phone", style: primary700.copyWith(fontSize: 20.0)),
        scrolledUnderElevation: 0.0,
      ),
      body: LayoutBuilder(
        builder: (context, constraints) => SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(
              minHeight: constraints.maxHeight,
            ),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.all(20.0),
                    width: constraints.maxWidth,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        color: ColorApps.white,
                        boxShadow:boxShadow),
                    child: Form(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Please enter your new telephone number",
                            style: black400.copyWith(fontSize: 14.0),
                          ),
                          const SizedBox(
                            height: 20.0,
                          ),
                          FormAppsTwo(
                            controller: phoneEditP.passController,
                            labelText: "08672224441131",
                            // obscure: phoneEditP.isObsecure,
                            // suffixIcon: true,
                            validator: (p0) {
                              if (p0!.isEmpty) {
                                return "Password is required";
                              }
                              return null;
                            },
                            onTap: () => phoneEditP.hidePass(),
                          ),
                          const SizedBox(
                            height: 20.0,
                          ),
                          BtnApps(
                            onPress: () {},
                            text: "Update",
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
