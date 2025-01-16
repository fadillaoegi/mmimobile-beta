import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/website_controller.dart';

class WebsiteView extends GetView<WebsiteController> {
  const WebsiteView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('WebsiteView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'WebsiteView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
