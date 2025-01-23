import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/profile_update_phone_controller.dart';

class ProfileUpdatePhoneView extends GetView<ProfileUpdatePhoneController> {
  const ProfileUpdatePhoneView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ProfileUpdatePhoneView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'ProfileUpdatePhoneView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
