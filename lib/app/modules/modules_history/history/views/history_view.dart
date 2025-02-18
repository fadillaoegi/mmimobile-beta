import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:mmimobile/app/routes/app_pages.dart';
import 'package:mmimobile/app/styles/fonts.dart';
import 'package:mmimobile/app/widget/item_history_widget.dart';
import '../controllers/history_controller.dart';

class HistoryView extends GetView<HistoryController> {
  const HistoryView({super.key});
  @override
  Widget build(BuildContext context) {
    final sizeScreen = MediaQuery.sizeOf(context);
    final controller = Get.put(HistoryController());
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        scrolledUnderElevation: 0.0,
        centerTitle: false,
        title: Text(
          "History",
          style: primary700.copyWith(fontSize: 20.0),
        ),
      ),
      body: SafeArea(
        child: Container(
          width: sizeScreen.width,
          height: sizeScreen.height,
          padding: const EdgeInsets.all(24.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ListView.builder(
                  itemCount: 10,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) => ItemHistory(
                    onTap: () {
                      Get.toNamed(Routes.historyDetail);
                    },
                    shadow: false,
                    nameSO: "SO-24-007191",
                    productCount: 10,
                    date: "01-October-2024",
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
