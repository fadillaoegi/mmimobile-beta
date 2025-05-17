import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:mmimobile/app/styles/color.dart';
import 'package:mmimobile/app/styles/fonts.dart';
import 'package:mmimobile/app/styles/shadow.dart';
import '../controllers/membership_controller.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:mmimobile/app/routes/app_pages.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:mmimobile/app/helpers/helper_fldev.dart';
import 'package:mmimobile/app/widget/loading_widget.dart';
import 'package:mmimobile/app/widget/appbar_apps_widget.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:mmimobile/app/widget/section_title_widget.dart';
import 'package:mmimobile/app/widget/item_privilege_widget.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:mmimobile/app/modules/modules_auth/data/controller/user_controller.dart';

class MembershipView extends GetView<MembershipController> {
  const MembershipView({super.key});
  @override
  Widget build(BuildContext context) {
    final sizeScreen = MediaQuery.sizeOf(context);
    final userData = Get.put(UserController());
    final controller = Get.put(MembershipController());
    // final membership = "Prioritas";
    return Obx(
      () => Scaffold(
        appBar: AppBarAppFLdev(
          title: "Membership",
          color: ColorApps.white,
          colorFontIcon: ColorApps.secondary,
        ),
        body: RefreshIndicator(
          onRefresh: () => controller.refreshData(),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // NOTE: SECTION 1
                sectionOneMembership(sizeScreen, userData),
                const SizedBox(
                  height: 10.0,
                ),

                // NOTE SECTION 2
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Obx(
                    () {
                      if (controller.isLoading.value) {
                        return const Center(
                          child: LoadingApps(),
                        );
                      }

                      return Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SectionTittle(title: "Hak Istimewa", size: 20.0),
                          const SizedBox(height: 10.0),
                          if (controller.membershipDataBenefit.isEmpty)
                            Center(
                              child: Text(
                                "Tidak ada data privilege.",
                                style: black400.copyWith(fontSize: 14.0),
                              ),
                            )
                          else
                            ListView.builder(
                              itemCount:
                                  controller.membershipDataBenefit.length,
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemBuilder: (context, index) {
                                final membership =
                                    controller.membershipDataBenefit[index];
                                return Obx(() => ItemPrivilege(
                                      claimed: controller.privilage.value,
                                      
                                      onTap: () => controller.claimPrivilage(),
                                      privilagenName: membership
                                              .customerMembershipBenefit ??
                                          "Tidak ada benefit",
                                    ));
                              },
                            ),
                        ],
                      );
                    },
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Container sectionOneMembership(Size sizeScreen, UserController userData) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
      width: sizeScreen.width,
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: [
          HelperFldev.safeHexToColor(controller
              .membershipData.value.customerMembershipColor
              .toString()),
          HelperFldev.safeHexToColor(controller
              .membershipData.value.customerMembershipColorSecond
              .toString()),
        ], begin: Alignment.bottomRight, end: Alignment.topLeft),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                userData.user.customerMembershipName.toString(),
                style: white700.copyWith(fontSize: 28.0, shadows: boxShadow),
              ),
              GestureDetector(
                onTap: () => Get.toNamed(Routes.detailMembership),
                child: Container(
                  padding: EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                      color: const Color.fromARGB(98, 16, 16, 16),
                      borderRadius: BorderRadius.circular(10.0)),
                  child: Row(
                    children: [
                      Text(
                        "Lihat semua level",
                        style: white600,
                      ),
                      Icon(
                        Icons.arrow_forward_ios_outlined,
                        color: ColorApps.white,
                        size: 16.0,
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 10.0,
          ),
          Text(
            HelperFldev.dotOverflowText(userData.user.customerName.toString()),
            style: white700.copyWith(
              fontSize: 16.0,
              // shadows: boxShadow,
            ),
          ),
          const SizedBox(
            height: 20.0,
          ),
          Container(
            padding:
                const EdgeInsets.symmetric(horizontal: 10.0, vertical: 14.0),
            decoration: BoxDecoration(
                color: ColorApps.white,
                boxShadow: boxShadow,
                borderRadius: BorderRadius.circular(10.0)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Rp 1.000.000.001 - 5.000.000.000 transaksi",
                  style: secondary400.copyWith(fontSize: 14.0),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                const StepProgressIndicator(
                  totalSteps: 100,
                  currentStep: 32,
                  size: 8,
                  padding: 0,
                  // selectedColor: Colors.yellow,
                  // unselectedColor: Colors.cyan,
                  roundedEdges: Radius.circular(10),
                  selectedGradientColor: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [ColorApps.primary, ColorApps.secondary],
                  ),
                  unselectedGradientColor: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      ColorApps.icon,
                      ColorApps.white,
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                Text(
                  "Tingkatkan pembelanjaan anda hingga 30.06.2025 untuk tetap berada di Platinum",
                  style: secondary400.copyWith(
                    fontSize: 14.0,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
