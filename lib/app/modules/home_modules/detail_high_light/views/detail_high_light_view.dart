import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/detail_high_light_controller.dart';

class DetailHighLightView extends GetView<DetailHighLightController> {
  const DetailHighLightView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('DetailHighLightView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'DetailHighLightView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
