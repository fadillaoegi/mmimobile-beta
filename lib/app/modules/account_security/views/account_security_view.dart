import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/account_security_controller.dart';

class AccountSecurityView extends GetView<AccountSecurityController> {
  const AccountSecurityView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AccountSecurityView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'AccountSecurityView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
