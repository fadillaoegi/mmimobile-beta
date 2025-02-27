import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/detail_membership_controller.dart';

class DetailMembershipView extends GetView<DetailMembershipController> {
  const DetailMembershipView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('DetailMembershipView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'DetailMembershipView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
