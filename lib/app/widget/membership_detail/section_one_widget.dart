import 'package:flutter/widgets.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:mmimobile/app/configs/format_config.dart';
import 'package:mmimobile/app/helpers/helper_fldev.dart';
import 'package:mmimobile/app/modules/modules_profile/detail_membership/controllers/detail_membership_controller.dart';
import 'package:mmimobile/app/styles/fonts.dart';
import 'package:mmimobile/app/styles/shadow.dart';

class SectionOneMembershipDetail extends StatelessWidget {
  const SectionOneMembershipDetail({super.key, required this.controller});
  final DetailMembershipController controller;

  @override
  Widget build(BuildContext context) {
    final screenSized = MediaQuery.sizeOf(context);
    return SizedBox(
      width: screenSized.width,
      child: Obx(() => Column(
            children: List.generate(
              (controller.dataMembership.length / 2).ceil(),
              (rowIndex) {
                final start = rowIndex * 2;
                final end = (start + 2 < controller.dataMembership.length)
                    ? start + 2
                    : controller.dataMembership.length;
                final rowItems = controller.dataMembership.sublist(start, end);
                return Padding(
                  padding: const EdgeInsets.only(
                      bottom: 10.0, left: 12.0, right: 12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: rowItems.map((item) {
                          String name = item.customerMembershipName.toString();
                          String color =
                              item.customerMembershipColor.toString();
                          String colorSecond =
                              item.customerMembershipColorSecond.toString();
                          int min =
                              int.parse(item.customerMembershipMin.toString());
                          int max =
                              int.parse(item.customerMembershipMax.toString());

                          return Container(
                            width: MediaQuery.sizeOf(context).width / 2.4,
                            margin: const EdgeInsets.only(right: 10.0),
                            height: 100.0,
                            padding: const EdgeInsets.all(10.0),
                            decoration: BoxDecoration(
                              boxShadow: boxShadow,
                              gradient: LinearGradient(
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
                    ],
                  ),
                );
              },
            ),
          )),
    );
  }
}
