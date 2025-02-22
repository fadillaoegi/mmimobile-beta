import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mmimobile/app/configs/format_config.dart';
import 'package:mmimobile/app/styles/color.dart';
import 'package:mmimobile/app/widget/appbar_apps_widget.dart';
import 'package:mmimobile/app/widget/loading_widget.dart';
import '../controllers/history_detail_controller.dart';
import 'package:mmimobile/app/widget/item_history_widget.dart';
import 'package:mmimobile/app/widget/list_between_widget.dart';

class HistoryDetailView extends GetView<HistoryDetailController> {
  const HistoryDetailView({super.key});

  @override
  Widget build(BuildContext context) {
    final sizeScreen = MediaQuery.sizeOf(context);
    final dataSo = Get.arguments;

    return Scaffold(
      appBar: AppBarAppFLdev(
        title: "Detail History",
      ),
      body: Container(
        height: sizeScreen.height,
        width: sizeScreen.width,
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListBetween(
              field: "ID : ",
              value: dataSo['nameSo'] ?? "Unknown",
            ),
            const SizedBox(height: 10.0),
            ListBetween(
              field: "Category : ",
              value: dataSo['categorySo'] ?? "Unknown",
            ),
            const SizedBox(height: 10.0),
            ListBetween(
              field: "Type : ",
              value: dataSo['typeSo'] ?? "Unknown",
            ),
            const SizedBox(height: 20.0),
            Expanded(
              child: Obx(() {
                if (controller.isLoading.value) {
                  return const Center(child: LoadingApps());
                }
                if (controller.errorMessage.isNotEmpty) {
                  return Center(
                    child: Text(
                      controller.errorMessage.value,
                      style: const TextStyle(color: Colors.red),
                    ),
                  );
                }
                if (controller.items.isEmpty) {
                  return const Center(child: Text("No history available."));
                }
                return ListView.builder(
                  itemCount: controller.items.length,
                  itemBuilder: (context, index) {
                    final item = controller.items[index];
                    return ItemHistory(
                      onTap: () {
                        Get.toNamed('/product-detail');
                      },
                      isDetail: true,
                      shadow: false,
                      productName: item.productName!,
                      brandName: item.brandName!,
                      qty: int.parse(item.productQty!),
                      count: int.parse(item.productTotal!),
                      priceProduct: int.parse(item.productPrice!),
                      date: FormatAppsFLdev.dateFull(item.dateSo.toString()),
                    );
                  },
                );
              }),
            ),
            const Divider(color: ColorApps.primary),
            const SizedBox(height: 10.0),
            const ListBetween(
              field: "Total : ",
              value: "Rp. 0",
            ),
          ],
        ),
      ),
    );
  }
}
