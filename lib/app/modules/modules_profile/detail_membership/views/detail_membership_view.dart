import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:mmimobile/app/styles/color.dart';
import 'package:mmimobile/app/styles/fonts.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:mmimobile/app/widget/loading_widget.dart';
import 'package:mmimobile/app/widget/canva_apps_widget.dart';
import 'package:mmimobile/app/widget/appbar_apps_widget.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:mmimobile/app/widget/item_privilege_widget.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:mmimobile/app/widget/membership_detail/section_one_widget.dart';
import 'package:mmimobile/app/modules/modules_profile/detail_membership/controllers/detail_membership_controller.dart';

class DetailMembershipView extends GetView<DetailMembershipController> {
  const DetailMembershipView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(DetailMembershipController());
    return Obx(
      () => ModalProgressHUD(
        inAsyncCall: controller.isLoading.value,
        dismissible: controller.isLoading.value,
        progressIndicator: LoadingApps(),
        child: Scaffold(
          appBar: AppBarAppFLdev(title: "Rincian membership"),
          body: CanvaFLdev(
            widget: SingleChildScrollView(
              child: Column(
                children: [
                  // NOTE: SECTION 1 
                  SizedBox(
                    width: MediaQuery.sizeOf(context).width,
                    child: Center(
                      child: SectionOneMembershipDetail(
                        controller: controller
                      ),
                    ),
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
                          String categoryId = controller
                              .dataMembership[index].customerMembershipId
                              .toString();
                          String categoryName = controller
                              .dataMembership[index].customerMembershipName
                              .toString();

                          return InkWell(
                            onTap: () => controller.setCategory(categoryId),
                            child: Obx(() {
                              if (controller.isLoading.value) {
                                return const Center(
                                  child: LoadingApps(),
                                );
                              }

                              return Container(
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
                                  categoryName,
                                  textAlign: TextAlign.center,
                                  style: controller.selectedCategoryId.value ==
                                          categoryId
                                      ? white500
                                      : black700,
                                ),
                              );
                            }),
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
                  Obx(() {
                    if (controller.isLoading.value) {
                      return const Center(
                        child: LoadingApps(),
                      );
                    }
                    return ListView.builder(
                      itemCount: controller.membershipDataBenefit.length,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        final membership =
                            controller.membershipDataBenefit[index];
                        return ItemPrivilege(
                          btnClaim: false,
                          privilagenName:
                              membership.customerMembershipBenefit ??
                                  "Tidak ada benefit",
                        );
                      },
                    );
                  }),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
