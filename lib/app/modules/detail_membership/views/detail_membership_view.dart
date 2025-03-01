import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:mmimobile/app/styles/color.dart';
import 'package:mmimobile/app/styles/fonts.dart';
import 'package:mmimobile/app/styles/shadow.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:mmimobile/app/configs/asset_config.dart';
import 'package:mmimobile/app/widget/canva_apps_widget.dart';
import 'package:mmimobile/app/widget/appbar_apps_widget.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:mmimobile/app/modules/detail_membership/controllers/detail_membership_controller.dart';

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
            const SectionOneMembershipDetail(),
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
  const SectionOneMembershipDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        boxShadow: boxShadow,
        color: ColorApps.white,
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                  child: Material(
                      elevation: 10.0,
                      borderRadius: BorderRadius.circular(10.0),
                      child: Image.asset(
                        AssetConfigFLdev.silverCard,
                      ))),
              const SizedBox(width: 10.0),
              Expanded(
                  child: Material(
                      elevation: 4.0,
                      borderRadius: BorderRadius.circular(10.0),
                      child: Image.asset(AssetConfigFLdev.goldCard))),
            ],
          ),
          const SizedBox(height: 10.0),
          Row(
            children: [
              Expanded(
                  child: Material(
                      elevation: 4.0,
                      borderRadius: BorderRadius.circular(10.0),
                      child: Image.asset(AssetConfigFLdev.platinumCard))),
              const SizedBox(width: 10.0),
              Expanded(
                  child: Material(
                      elevation: 10.0,
                      borderRadius: BorderRadius.circular(10.0),
                      child: Image.asset(AssetConfigFLdev.prioritasCard))),
            ],
          ),
        ],
      ),
    );
  }
}
