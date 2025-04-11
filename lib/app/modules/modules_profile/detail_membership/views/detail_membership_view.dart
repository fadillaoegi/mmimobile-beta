import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:mmimobile/app/styles/color.dart';
import 'package:mmimobile/app/styles/fonts.dart';
import 'package:mmimobile/app/styles/shadow.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:mmimobile/app/helpers/helper_fldev.dart';
import 'package:mmimobile/app/configs/format_config.dart';
import 'package:mmimobile/app/widget/loading_widget.dart';
import 'package:mmimobile/app/widget/canva_apps_widget.dart';
import 'package:mmimobile/app/widget/appbar_apps_widget.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:mmimobile/app/modules/modules_profile/detail_membership/controllers/detail_membership_controller.dart';

class DetailMembershipView extends GetView<DetailMembershipController> {
  const DetailMembershipView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(DetailMembershipController());
    return Obx(
      () => ModalProgressHUD(
        inAsyncCall: controller.isLoading.value,
        progressIndicator: LoadingApps(),
        child: Scaffold(
          appBar: AppBarAppFLdev(title: "Rincian membership"),
          body: CanvaApps(
            widget: SingleChildScrollView(
              child: Column(
                children: [
                  // NOTE: SECTION 1
                  SectionOneMembershipDetail(
                    controller: controller,
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),

                  // NOTE: SECTION 2
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: List.generate(
                        controller.dataMembership.length,
                        (index) {
                          // String category = controller.dataMembership[index].toString();
                          // String category = c)ontroller.dataMembership[index]
                          //         ["customer_membership_name"]
                          //     .toString();
                          String categoryId = controller
                              .dataMembership[index].customerMembershipId
                              .toString();
                          String category = controller
                              .dataMembership[index].customerMembershipName
                              .toString();

                          return InkWell(
                            // onTap: () => controller.setCategory(category),
                            onTap: () => controller.setCategory(categoryId),
                            child: Obx(
                              () => Container(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 6.0, horizontal: 12.0),
                                decoration: BoxDecoration(
                                  color: controller.selectedCategoryId.value ==
                                          categoryId
                                      ? ColorApps.secondary
                                      : Colors.transparent,
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                child: Text(
                                  category,
                                  textAlign: TextAlign.center,
                                  style: controller.selectedCategoryId.value ==
                                          categoryId
                                      ? white500
                                      : black700,
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10.0),
                    child: Divider(
                      color: ColorApps.secondary,
                    ),
                  ),

                  // NOTE: SECTION 3 - category display selected
                  Obx(
                    () => Text(
                      "Kategori yang dipilih: ${controller.selectedCategoryId.value}",
                      style: black700.copyWith(fontSize: 16.0),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class SectionOneMembershipDetail extends StatelessWidget {
  const SectionOneMembershipDetail({super.key, required this.controller});
  final DetailMembershipController controller;

  @override
  Widget build(BuildContext context) {
    return Obx(() => Center(
          child: Column(
            children: List.generate(
              (controller.dataMembership.length / 2).ceil(),
              (rowIndex) {
                final start = rowIndex * 2;
                final end = (start + 2 < controller.dataMembership.length)
                    ? start + 2
                    : controller.dataMembership.length;

                final rowItems = controller.dataMembership.sublist(start, end);

                return Padding(
                  padding: const EdgeInsets.only(bottom: 10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: rowItems.map((item) {
                      String name = item.customerMembershipName.toString();
                      String color = item.customerMembershipColor.toString();
                      String colorSecond =
                          item.customerMembershipColorSecond.toString();
                      int min =
                          int.parse(item.customerMembershipMin.toString());
                      int max =
                          int.parse(item.customerMembershipMax.toString());

                      return Container(
                        width: 160.0,
                        margin: const EdgeInsets.only(right: 10.0),
                        height: 100.0,
                        padding: const EdgeInsets.all(10.0),
                        decoration: BoxDecoration(
                          boxShadow: boxShadow,
                          gradient: LinearGradient(
                            // colors: _getMembershipColors(name),

                            colors: [
                              HelperFldev.safeHexToColor(colorSecond),
                              HelperFldev.safeHexToColor(color),
                            ],
                          ),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              name,
                              style: white700.copyWith(fontSize: 14.0),
                            ),
                            const SizedBox(height: 10.0),
                            Text(
                              // "${_formatCurrency(min)} - ${_formatCurrency(max)}",
                              "${FormatAppsFLdev.currencyShort(min.toString())} - ${FormatAppsFLdev.currencyShort(max.toString())}",
                              style: white500.copyWith(fontSize: 12.0),
                            ),
                          ],
                        ),
                      );
                    }).toList(),
                  ),
                );
              },
            ),
          ),
        ));
  }
}
