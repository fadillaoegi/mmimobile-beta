import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/underdevelopment_controller.dart';

class UnderdevelopmentView extends GetView<UnderdevelopmentController> {
  const UnderdevelopmentView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('UnderdevelopmentView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'UnderdevelopmentView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
