import 'package:easy_refresh/easy_refresh.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:mmimobile/app/configs/format_config.dart';
import 'package:mmimobile/app/modules/modules_auth/data/controller/user_controller.dart';
import 'package:mmimobile/app/routes/app_pages.dart';
import 'package:mmimobile/app/styles/fonts.dart';
import 'package:mmimobile/app/widget/item_history_widget.dart';
import '../controllers/history_controller.dart';

class HistoryView extends GetView<HistoryController> {
  const HistoryView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HistoryController());
    final user = Get.put(UserController());
    final customerId = user.user.customerId;

    // Fetch data on view load
    controller.fetchHistory(customerId!);

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
        child: Obx(() {
          if (controller.isLoading.value && controller.historyList.isEmpty) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          return EasyRefresh(
            header: const ClassicHeader(),
            footer: const ClassicFooter(),
            onRefresh: () async {
              // Pull to refresh
              await controller.fetchHistory(customerId, isLoadMore: false);
            },
            onLoad: () async {
              // Load more
              await controller.fetchHistory(customerId, isLoadMore: true);
            },
            child: controller.historyList.isEmpty
                ? Center(
                    child: Text(
                      "No history available.",
                      style: primary500.copyWith(fontSize: 16.0),
                    ),
                  )
                : ListView.builder(
                    padding: const EdgeInsets.all(24.0),
                    itemCount: controller.historyList.length,
                    itemBuilder: (context, index) {
                      final item = controller.historyList[index];
                      return ItemHistory(
                        onTap: () {
                          Get.toNamed(Routes.historyDetail);
                        },
                        shadow: false,
                        nameSO: item.nameSo ?? "Unknown",
                        productCount: int.tryParse(item.totalSo ?? "0") ?? 0,
                        date: FormatAppsFLdev.dateFull(item.date.toString()),
                      );
                    },
                  ),
          );
        }),
      ),
    );
  }
}





// import 'package:flutter/material.dart';
// import 'package:get/get_core/src/get_main.dart';
// import 'package:get/get_instance/get_instance.dart';
// import 'package:get/get_navigation/get_navigation.dart';
// import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
// import 'package:get/get_state_manager/src/simple/get_view.dart';
// import 'package:mmimobile/app/modules/modules_auth/data/controller/user_controller.dart';
// import 'package:mmimobile/app/routes/app_pages.dart';
// import 'package:mmimobile/app/styles/fonts.dart';
// import 'package:mmimobile/app/widget/item_history_widget.dart';
// import '../controllers/history_controller.dart';

// class HistoryView extends GetView<HistoryController> {
//   const HistoryView({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final controller = Get.put(HistoryController());
//     final user = Get.put(UserController());
//     final customerId = user.user.customerId;
//     controller.fetchHistory(customerId!);
//     return Scaffold(
//       appBar: AppBar(
//         automaticallyImplyLeading: false,
//         scrolledUnderElevation: 0.0,
//         centerTitle: false,
//         title: Text(
//           "History",
//           style: primary700.copyWith(fontSize: 20.0),
//         ),
//       ),
//       body: SafeArea(
//         child: RefreshIndicator(
//           onRefresh: () async {
//             await controller.fetchHistory(customerId);
//           },
//           child: Obx(() {
//             if (controller.isLoading.value) {
//               return const Center(
//                 child: CircularProgressIndicator(),
//               );
//             }

//             if (controller.historyList.isEmpty) {
//               return Center(
//                 child: Text(
//                   "No history available.",
//                   style: primary500.copyWith(fontSize: 16.0),
//                 ),
//               );
//             }

//             return ListView.builder(
//               padding: const EdgeInsets.all(24.0),
//               itemCount: controller.historyList.length,
//               itemBuilder: (context, index) {
//                 final item = controller.historyList[index];
//                 return ItemHistory(
//                   onTap: () {
//                     Get.toNamed(Routes.historyDetail);
//                   },
//                   shadow: false,
//                   nameSO: item.nameSo ?? "Unknown",
//                   productCount: int.tryParse(item.totalSo ?? "0") ?? 0,
//                   date: item.date?.toIso8601String() ?? "No Date",
//                 );
//               },
//             );
//           }),
//         ),
//       ),
//     );
//   }
// }

