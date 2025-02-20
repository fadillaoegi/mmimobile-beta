import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:easy_refresh/easy_refresh.dart';
import 'package:mmimobile/app/styles/color.dart';
import 'package:mmimobile/app/styles/fonts.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:mmimobile/app/routes/app_pages.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:mmimobile/app/configs/format_config.dart';
import 'package:mmimobile/app/widget/item_history_widget.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:mmimobile/app/modules/modules_auth/data/controller/user_controller.dart';
import 'package:mmimobile/app/modules/modules_history/history/controllers/history_controller.dart';
import 'package:mmimobile/app/widget/loading_widget.dart';

class HistoryView extends GetView<HistoryController> {
  const HistoryView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HistoryController());
    final user = Get.put(UserController());
    final customerId = user.user.customerId;
    final searchController = TextEditingController();

    // NOTE: Fetch data
    controller.fetchHistory(customerId!, null);

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        scrolledUnderElevation: 0.0,
        centerTitle: false,
        title: Text(
          "History",
          style: primary700.copyWith(fontSize: 20.0),
        ),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(60.0),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: TextField(
              controller: searchController,
              onChanged: (value) {
                // Jika teks dihapus, reset data tanpa pencarian
                if (value.isEmpty) {
                  controller.fetchHistory(customerId, null);
                }
              },
              autofocus: false,
              decoration: InputDecoration(
                hintText: 'Search history...',
                suffixIcon: GestureDetector(
                  onTap: () {
                    // Kirim pencarian saat ikon diklik
                    controller.fetchHistory(
                      customerId,
                      searchController.text.isEmpty
                          ? null
                          : searchController.text,
                    );
                  },
                  child: Icon(
                    Icons.search,
                    color: ColorApps.primary,
                    size: 30.0,
                  ),
                ),
                focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: ColorApps.primary)),
              ),
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: Obx(() {
          if (controller.isLoading.value && controller.historyList.isEmpty) {
            return Center(
              child: LoadingApps(),
            );
          }

          return EasyRefresh(
            header: const ClassicHeader(),
            footer: controller.hasMoreData.value
                ? const ClassicFooter() // Footer hanya ditampilkan jika masih ada data tambahan
                : null,
            onRefresh: () async {
              // Refresh data
              await controller.fetchHistory(
                customerId,
                searchController.text.isEmpty ? null : searchController.text,
                isLoadMore: false,
              );
            },
            onLoad: controller.hasMoreData.value
                ? () async {
                    // Load data tambahan
                    await controller.fetchHistory(
                      customerId,
                      searchController.text.isEmpty
                          ? null
                          : searchController.text,
                      isLoadMore: true,
                    );
                  }
                : null,
            child: controller.historyList.isEmpty
                ? Center(
                    child: Text(
                      "You don't have any history yet",
                      style: primary500.copyWith(fontSize: 16.0),
                    ),
                  )
                : ListView.builder(
                    padding: const EdgeInsets.all(14.0),
                    itemCount: controller.historyList.length,
                    itemBuilder: (context, index) {
                      final item = controller.historyList[index];
                      final date =
                          FormatAppsFLdev.dateFull(item.dateSo.toString());
                      return ItemHistory(
                        onTap: () {
                          Get.toNamed(Routes.historyDetail, arguments: {
                            'nameSo': item.nameSo?.toString() ?? "",
                            'categorySo': item.categorySo?.toString() ?? "",
                            'typeSo': item.typeSo?.toString() ?? "",
                          });
                        },
                        shadow: false,
                        nameSO: item.nameSo ?? "No name SO",
                        brandName: item.brandSo ?? "No brand name SO",
                        productCount: int.tryParse(item.totalSo ?? "0") ?? 0,
                        date: date.isNotEmpty ? date : "date has not been set",
                      );
                    },
                  ),
          );
        }),
      ),
    );
  }
}
