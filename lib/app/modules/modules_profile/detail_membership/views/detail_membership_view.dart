import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:mmimobile/app/configs/format_config.dart';
import 'package:mmimobile/app/helpers/helper_fldev.dart';
import 'package:mmimobile/app/styles/color.dart';
import 'package:mmimobile/app/styles/fonts.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:mmimobile/app/styles/shadow.dart';
import 'package:mmimobile/app/widget/canva_apps_widget.dart';
import 'package:mmimobile/app/widget/appbar_apps_widget.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:mmimobile/app/modules/modules_profile/detail_membership/controllers/detail_membership_controller.dart';

class DetailMembershipView extends GetView<DetailMembershipController> {
  const DetailMembershipView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(DetailMembershipController());
    return Scaffold(
      appBar: AppBarAppFLdev(title: "Rincian membership"),
      body: CanvaApps(
        widget: Column(
          children: [
            // NOTE: SECTION 1
            SectionOneMembershipDetail(
              controller: controller,
            ),
            const SizedBox(
              height: 20.0,
            ),
            // NOTE: SECTION 2
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: List.generate(
                controller.categoryMembership.length,
                (index) {
                  String category = controller.categoryMembership[index];
                  return InkWell(
                    onTap: () => controller.setCategory(category),
                    child: Obx(
                      () => Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 6.0, horizontal: 12.0),
                        decoration: BoxDecoration(
                          color: controller.selectedCategory.value == category
                              ? ColorApps.secondary
                              : Colors.transparent,
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: Text(
                          category,
                          textAlign: TextAlign.center,
                          style: controller.selectedCategory.value == category
                              ? white500
                              : black700,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              child: Divider(
                color: ColorApps.secondary,
              ),
            ),

            // NOTE: SECTION 3 - Menampilkan kategori terpilih
            Obx(
              () => Text(
                "Kategori yang dipilih: ${controller.selectedCategory.value}",
                style: black700.copyWith(fontSize: 16.0),
              ),
            ),
          ],
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
    return Obx(() => Column(
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
                  children: rowItems.map((item) {
                    String name = item["customer_membership_name"].toString();
                    String color = item["customer_membership_color"].toString();
                    String colorSecond =
                        item["customer_membership_color_second"].toString();
                    int min =
                        int.parse(item["customer_membership_min"].toString());
                    int max =
                        int.parse(item["customer_membership_max"].toString());

                    return Expanded(
                      child: Container(
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
                      ),
                    );
                  }).toList(),
                ),
              );
            },
          ),
        ));
  }

  List<Color> _getMembershipColors(String? membership) {
    switch (membership) {
      case "Gold":
        return [ColorApps.goldMember2, ColorApps.goldMember];
      case "Platinum":
        return [ColorApps.platinumMember2, ColorApps.platinumMember];
      case "Prioritas":
        return [ColorApps.prioritasMember2, ColorApps.prioritasMember];
      default:
        return [ColorApps.silverMember, ColorApps.silverMember];
    }
  }
}
