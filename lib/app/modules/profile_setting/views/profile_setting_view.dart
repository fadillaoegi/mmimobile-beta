import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:mmimobile/app/styles/color.dart';
import 'package:mmimobile/app/styles/fonts.dart';
import 'package:mmimobile/app/styles/shadow.dart';
import 'package:mmimobile/app/widget/image_circle_widget.dart';
import '../controllers/profile_setting_controller.dart';

class ProfileSettingView extends GetView<ProfileSettingController> {
  const ProfileSettingView({super.key});
  @override
  Widget build(BuildContext context) {
    final sizeScreen = MediaQuery.sizeOf(context);
    final controller = Get.put(ProfileSettingController());
    return Scaffold(
      appBar: AppBar(
        // centerTitle: true,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Setting Profile",
              style: primary600.copyWith(fontSize: 20.0),
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.check,
                color: ColorApps.primary,
              ),
            )
          ],
        ),
        scrolledUnderElevation: 0.0,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Container(
                width: sizeScreen.width,
                height: sizeScreen.height / 4,
                decoration: BoxDecoration(color: ColorApps.primary),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const ImageCircle(
                      size: 80.0,
                    ),
                  ],
                ),
              )
            ],
          ),
          const SizedBox(height: 20.0),
          TwoItemProfileSetting(
            onTap: () {},
            title: "Name",
            value: "John Doe",
            onTapTwo: () {},
            titleTwo: "Email",
            valueTwo: "johndoe@example.com",
          ),
          const SizedBox(height: 20.0),
          TwoItemProfileSetting(
            onTap: () {},
            title: "Phone",
            value: "08*****",
            onTapTwo: () {},
            titleTwo: "Password",
            valueTwo: "*******",
          ),
        ],
      ),
    );
  }
}

class TwoItemProfileSetting extends StatelessWidget {
  const TwoItemProfileSetting({
    super.key,
    this.value = "",
    this.valueTwo = "",
    this.title = "",
    this.titleTwo = "",
    this.onTap,
    this.onTapTwo,
  });

  final String? title;
  final String? value;
  final VoidCallback? onTap;
  final String? titleTwo;
  final String? valueTwo;
  final VoidCallback? onTapTwo;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: ColorApps.white,
        boxShadow: boxShadow,
      ),
      child: Column(
        children: [
          GestureDetector(
            onTap: onTap,
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 10.0, vertical: 14.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    title ?? "",
                    style: black400.copyWith(fontSize: 13.0),
                  ),
                  Row(
                    children: [
                      Text(
                        value ?? "",
                        style: black400.copyWith(fontSize: 13.0),
                      ),
                      const SizedBox(
                        width: 10.0,
                      ),
                      Icon(
                        Icons.arrow_forward_ios_rounded,
                        size: 18.0,
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
          Divider(
            color: ColorApps.disable2,
            thickness: 0.1,
          ),
          GestureDetector(
            onTap: onTapTwo,
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 10.0, vertical: 14.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    titleTwo ?? "",
                    style: black400.copyWith(fontSize: 13.0),
                  ),
                  Row(
                    children: [
                      Text(
                        valueTwo ?? "",
                        style: black400.copyWith(fontSize: 13.0),
                      ),
                      const SizedBox(
                        width: 10.0,
                      ),
                      Icon(
                        Icons.arrow_forward_ios_rounded,
                        size: 18.0,
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
