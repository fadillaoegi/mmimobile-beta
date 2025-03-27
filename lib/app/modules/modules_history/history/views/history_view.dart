import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:easy_refresh/easy_refresh.dart';
import 'package:mmimobile/app/styles/color.dart';
import 'package:mmimobile/app/styles/fonts.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:mmimobile/app/routes/app_pages.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:mmimobile/app/widget/loading_widget.dart';
import 'package:mmimobile/app/configs/format_config.dart';
import 'package:mmimobile/app/widget/canva_apps_widget.dart';
import 'package:mmimobile/app/widget/appbar_apps_widget.dart';
import 'package:mmimobile/app/widget/History/item_history_widget.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:mmimobile/app/modules/modules_auth/data/controller/user_controller.dart';
import 'package:mmimobile/app/modules/modules_history/history/controllers/history_controller.dart';

class HistoryView extends GetView<HistoryController> {
  const HistoryView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HistoryController());
    final user = Get.put(UserController());
    final customerId = user.user.customerId;
    final searchController = TextEditingController();

    // NOTE: Fetch data
    // controller.fetchHistory(customerId ?? "", null);

    return Scaffold(
      appBar: AppBarAppFLdev(
        title: "Riwayat",
        backRoute: false,
      ),
      body: CanvaApps(
        widget: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Search Bar di dalam Body
            SearchFLdev(
                searchController: searchController,
                controller: controller,
                customerId: customerId),

            const SizedBox(
              height: 20.0,
            ),

            // Konten History
            Expanded(
              child: Obx(() {
                if (controller.isLoading.value &&
                    controller.historyList.isEmpty) {
                  return Center(
                    child: LoadingApps(),
                  );
                }

                return EasyRefresh(
                  header: const ClassicHeader(),
                  footer: controller.hasMoreData.value
                      ? const ClassicFooter()
                      : null,
                  onRefresh: () async {
                    await controller.fetchHistory(
                      customerId ?? "",
                      searchController.text.isEmpty
                          ? null
                          : searchController.text,
                      isLoadMore: false,
                    );
                  },
                  onLoad: controller.hasMoreData.value
                      ? () async {
                          await controller.fetchHistory(
                            customerId ?? "",
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
                            "Anda belum mempunyai riwayat pembelian",
                            style: secondary500.copyWith(fontSize: 16.0),
                          ),
                        )
                      : ListView.builder(
                          itemCount: controller.historyList.length,
                          itemBuilder: (context, index) {
                            final item = controller.historyList[index];
                            final date = FormatAppsFLdev.dateFull(
                                item.dateSo.toString());
                            return ItemHistory(
                              onTap: () {
                                Get.toNamed(Routes.historyDetail, arguments: {
                                  'idSo': item.nameSo?.toString() ?? "",
                                  'categorySo':
                                      item.categorySo?.toString() ?? "",
                                  'typeSo': item.typeSo?.toString() ?? "",
                                  'dateSo': item.dateSo?.toString() ?? "",
                                });
                              },
                              shadow: true, isDetail: false,
                              // statusName: item.statusNameSo.toString(),
                              // statusId: item.statusSo.toString(),
                              idSo: item.nameSo ?? "No id SO",
                              brandName: item.brandSo ?? "No brand name SO",
                              productCount:
                                  int.tryParse(item.totalSo ?? "0") ?? 0,
                              date: date.isNotEmpty
                                  ? date
                                  : "date has not been set",
                              statusSo: item.statusSo.toString(),
                            );
                          },
                        ),
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}

class SearchFLdev extends StatelessWidget {
  const SearchFLdev({
    super.key,
    required this.searchController,
    required this.controller,
    required this.customerId,
  });

  final TextEditingController searchController;
  final HistoryController controller;
  final String? customerId;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: searchController,
      // onChanged: (value) {
      //   if (value.isEmpty) {
      //     controller.fetchHistory(customerId, null);
      //   }
      // },
      onSubmitted: (value) {
        // FocusScope.of(context).unfocus();
        controller.fetchHistory(
          customerId!,
          searchController.text.isEmpty ? null : searchController.text,
        );
      },
      autofocus: false,
      decoration: InputDecoration(
        hintText: 'Cari riwayat...',
        fillColor: ColorApps.white,
        filled: true,
        hintStyle: disable500,
        suffixIcon: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
            controller.fetchHistory(
              customerId!,
              searchController.text.isEmpty ? null : searchController.text,
            );
          },
          child: Icon(
            Icons.search,
            color: ColorApps.secondary,
            size: 30.0,
          ),
        ),
        enabled: true,
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: ColorApps.disable, width: 2.0),
            borderRadius: BorderRadius.circular(50.0)),
        border: UnderlineInputBorder(
            borderSide: BorderSide(color: ColorApps.secondary, width: 2.0),
            borderRadius: BorderRadius.circular(50.0)),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: ColorApps.secondary, width: 2.0),
            borderRadius: BorderRadius.circular(50.0)),
      ),
    );
  }
}
