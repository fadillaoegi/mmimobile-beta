import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/profile_update_email_controller.dart';

class ProfileUpdateEmailView extends GetView<ProfileUpdateEmailController> {
  const ProfileUpdateEmailView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ProfileUpdateEmailView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'ProfileUpdateEmailView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
