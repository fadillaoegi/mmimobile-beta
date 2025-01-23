import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/profile_edit_name_controller.dart';

class ProfileEditNameView extends GetView<ProfileEditNameController> {
  const ProfileEditNameView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ProfileEditNameView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'ProfileEditNameView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
