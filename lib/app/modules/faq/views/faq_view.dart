import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:mmimobile/app/styles/fonts.dart';
import 'package:mmimobile/app/widget/faq/item_faq_widget.dart';

import '../controllers/faq_controller.dart';

class FaqView extends GetView<FaqController> {
  const FaqView({super.key});
  @override
  Widget build(BuildContext context) {
    final sizeScreen = MediaQuery.sizeOf(context);
    final controller = Get.put(FaqController());
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("FAQ", style: primary700.copyWith(fontSize: 20.0)),
        scrolledUnderElevation: 0.0,
      ),
      body: Container(
        height: sizeScreen.height,
        width: sizeScreen.width,
        padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
        child: ListView.builder(
          itemCount: controller.dataFaq.length,
          itemBuilder: (context, index) => ItemFaq(
            title: controller.dataFaq[index]["title"],
            desc: controller.dataFaq[index]["desc"],
          ),
        ),
      ),
    );
  }
}
