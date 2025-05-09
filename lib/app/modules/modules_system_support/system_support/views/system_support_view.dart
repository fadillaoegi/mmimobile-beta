import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:mmimobile/app/routes/app_pages.dart';
import 'package:mmimobile/app/widget/loading_widget.dart';
import 'package:mmimobile/app/widget/canva_apps_widget.dart';
import 'package:mmimobile/app/widget/appbar_apps_widget.dart';
import 'package:mmimobile/app/widget/system_support/item_list_support_widget.dart';
import 'package:mmimobile/app/modules/modules_system_support/system_support/controllers/system_support_controller.dart';

class SystemSupportView extends GetView<SystemSupportController> {
  const SystemSupportView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SystemSupportController());
    final sizeScreen = MediaQuery.sizeOf(context);
    return Obx(
      () => Scaffold(
        appBar: AppBarAppFLdev(
          title: "Support",
          backRoute: false,
        ),
        body: RefreshIndicator(
          onRefresh: () => controller.fetchSystemSupport(),
          child: controller.isLoading.value
              ? const Center(
                  child: Padding(
                    padding: EdgeInsets.only(top: 100.0),
                    child: LoadingApps(),
                  ),
                )
              : CanvaFLdev(
                  widget: SingleChildScrollView(
                    child: Column(
                      children: [
                        ListView.builder(
                          itemCount: controller.listDataSystemSuport.length,
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            final item = controller.listDataSystemSuport[index];
                            return ItemListSupport(
                              sizeScreen: sizeScreen,
                              onTap: () =>
                                  Get.toNamed(Routes.supportDetail, arguments: {
                                'id': item.masterSupportId.toString(),
                                'title': item.masterSupportTitle.toString(),
                                'img': item.masterSupportImg.toString(),
                                'desc': item.masterSupportDesc.toString(),
                                'link': item.masterSupportLink.toString(),
                              }),
                              imageUrl: item.masterSupportImg.toString(),
                              title: item.masterSupportTitle.toString(),
                            );
                          },
                        )
                      ],
                    ),
                  ),
                ),
        ),
      ),
    );
  }
}
