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

            // LIST HISTORY
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

                // Ambil item sesuai jumlah yang diizinkan
                final visibleItems = controller.items
                    .take(controller.visibleItemCount.value)
                    .toList();

                return SingleChildScrollView(
                  child: Column(
                    children: [
                      ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: visibleItems.length,
                        itemBuilder: (context, index) {
                          final item = visibleItems[index];
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
                            date: FormatAppsFLdev.dateFull(
                                item.dateSo.toString()),
                          );
                        },
                      ),

                      // Tombol "See More" atau "See Less"
                      if (controller.items.length > 2)
                        TextButton(
                          onPressed: () {
                            if (controller.isExpanded.value) {
                              // Jika sedang menampilkan semua data, kembali ke 2 item
                              controller.visibleItemCount.value = 2;
                              controller.isExpanded.value = false;
                            } else {
                              // Jika hanya menampilkan 2 item, tampilkan semua
                              controller.visibleItemCount.value =
                                  controller.items.length;
                              controller.isExpanded.value = true;
                            }
                          },
                          child: Text(
                            controller.isExpanded.value
                                ? "See Less"
                                : "See More",
                            style: const TextStyle(color: ColorApps.primary),
                          ),
                        ),
                    ],
                  ),
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
