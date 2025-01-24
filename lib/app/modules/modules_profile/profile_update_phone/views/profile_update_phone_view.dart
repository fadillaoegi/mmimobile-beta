import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

import '../controllers/profile_update_phone_controller.dart';

class ProfileUpdatePhoneView extends GetView<ProfileUpdatePhoneController> {
  const ProfileUpdatePhoneView({super.key});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Update Phone'),
          centerTitle: true,
        ),
        body: LayoutBuilder(
          builder: (context, constraints) => SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: constraints.maxHeight,
              ),
              child: Column(
                children: [
                  IntlPhoneField(
                    decoration: InputDecoration(
                      labelText: 'Phone Number',
                      border: OutlineInputBorder(
                        borderSide: BorderSide(),
                      ),
                    ),
                    initialCountryCode: '+62',
                    onChanged: (phone) {
                      print(phone.completeNumber);
                    },
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
