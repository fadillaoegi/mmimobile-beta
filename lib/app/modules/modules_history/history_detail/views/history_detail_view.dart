import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mmimobile/app/styles/fonts.dart';
import '../controllers/history_detail_controller.dart';
import 'package:mmimobile/app/widget/item_history_widget.dart';
import 'package:mmimobile/app/widget/list_between_widget.dart';
import 'package:mmimobile/app/styles/color.dart';

class HistoryDetailView extends GetView<HistoryDetailController> {
  const HistoryDetailView({super.key});

  @override
  Widget build(BuildContext context) {
    final sizeScreen = MediaQuery.sizeOf(context);
    final dataSo = Get.arguments;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Detail History", style: TextStyle(fontSize: 20.0)),
        scrolledUnderElevation: 0.0,
      ),
      body: Container(
        height: sizeScreen.height,
        width: sizeScreen.width,
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ListBetween(
                field: "ID : ",
                value: dataSo['nameSo'],
              ),
              const SizedBox(height: 10.0),
              ListBetween(
                field: "Category : ",
                value: dataSo['categorySo'],
              ),
              const SizedBox(height: 10.0),
              ListBetween(
                field: "Type : ",
                value: dataSo['typeSo'],
              ),
              const SizedBox(height: 30.0),
              Obx(
                () => ListView.builder(
                  itemCount: controller.displayedItemCount.value,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    final item = controller.items[index];
                    return ItemHistory(
                      onTap: () {
                        Get.toNamed(
                            '/product-detail'); // Sesuaikan dengan route
                      },
                      isDetail: true,
                      shadow: false,
                      productName: item["productName"],
                      brandName: item["brandName"],
                      date: item["date"],
                      priceProduct: item["priceProduct"],
                      qty: item["qty"],
                      count: item["count"],
                    );
                  },
                ),
              ),
              const SizedBox(height: 10.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Obx(
                    () => TextButton(
                      onPressed: controller.toggleSeeMore,
                      child: Text(
                        controller.displayedItemCount.value <
                                controller.items.length
                            ? "See More"
                            : "See Less",
                        style: primary500.copyWith(fontSize: 16.0),
                      ),
                    ),
                  ),
                ],
              ),
              const Divider(color: ColorApps.primary),
              const SizedBox(height: 10.0),
              ListBetween(
                field: "Total : ",
                value: "Rp. 0", // Sesuaikan dengan perhitungan total
              ),
            ],
          ),
        ),
      ),
    );
  }
}
