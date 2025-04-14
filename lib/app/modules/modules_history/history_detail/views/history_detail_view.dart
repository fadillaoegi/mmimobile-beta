import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:mmimobile/app/styles/color.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:mmimobile/app/widget/canva_apps_widget.dart';
import '../controllers/history_detail_controller.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:mmimobile/app/configs/format_config.dart';
import 'package:mmimobile/app/widget/loading_widget.dart';
import 'package:mmimobile/app/widget/appbar_apps_widget.dart';
import 'package:mmimobile/app/widget/History/item_history_widget.dart';
import 'package:mmimobile/app/widget/list_between_widget.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

class HistoryDetailView extends GetView<HistoryDetailController> {
  const HistoryDetailView({super.key});

  @override
  Widget build(BuildContext context) {
    // final sizeScreen = MediaQuery.sizeOf(context);
    final dataSo = Get.arguments;

    return Scaffold(
        appBar: AppBarAppFLdev(
          title: "Rincian riwayat",
        ),
        body: CanvaApps(
          top: 14.0,
          right: 14.0,
          left: 14.0,
          bottom: 36.0,
          widget: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ListBetween(
                field: "ID : ",
                value: dataSo['idSo'] ?? "Unknown",
              ),
              const SizedBox(height: 10.0),
              ListBetween(
                field: "Tanggal : ",
                value: FormatAppsFLdev.dateFull(dataSo['dateSo'].toString()),
              ),
              const SizedBox(height: 10.0),
              ListBetween(
                field: "Kategori : ",
                value: dataSo['categorySo'] ?? "Unknown",
              ),
              const SizedBox(height: 10.0),
              ListBetween(
                field: "Tipe : ",
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
                                // Get.toNamed(Routes.productDetail);
                              },
                              isDetail: true,
                              shadow: false,
                              productName: item.productName!,
                              qty: int.parse(item.productQty!),
                              count: int.parse(item.productTotal!),
                              priceProduct: int.parse(item.productPrice!),
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
                              style:
                                  const TextStyle(color: ColorApps.secondary),
                            ),
                          ),
                      ],
                    ),
                  );
                }),
              ),

              const Divider(color: ColorApps.secondary),
              const SizedBox(height: 10.0),
              Obx(
                () => ListBetween(
                  field: "Grand total : ",
                  value:
                      FormatAppsFLdev.currency(controller.sum.value.toString()),
                ),
              ),
            ],
          ),
        )

        // Container(
        //   height: sizeScreen.height,
        //   width: sizeScreen.width,
        //   padding: const EdgeInsets.all(20.0),
        //   child:

        // ),
        );
  }
}
