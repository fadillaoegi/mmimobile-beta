import 'package:flutter/material.dart';
import 'package:mmimobile/app/configs/asset_config.dart';
import 'package:mmimobile/app/styles/color.dart';
import 'package:mmimobile/app/styles/fonts.dart';
import 'package:mmimobile/app/widget/appbar_apps_widget.dart';
import 'package:mmimobile/app/widget/canva_apps_widget.dart';
import 'package:mmimobile/app/widget/section_title_widget.dart';
import '../controllers/support_detail_controller.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';

class SupportDetailView extends GetView<SupportDetailController> {
  const SupportDetailView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarAppFLdev(
        title: "Support detail",
      ),
      body: SingleChildScrollView(
        child: CanvaFLdev(
          widget: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                  borderRadius: BorderRadius.circular(6.0),
                  child: Image.asset(AssetConfigFLdev.banner1)),
              const SizedBox(
                height: 20.0,
              ),
              SectionTittle(
                title: "Make Up Your Brand",
                size: 18.0,
              ),
              const SizedBox(
                height: 10.0,
              ),
              Text(
                "Apakah Anda ingin brand anda lebih dikenal oleh banyak orang? Bergabunglah dengan pelatihan kami, 'Make Up Your Brand,' dan jadikan brand anda menjadi dikenali!",
                style: black400.copyWith(fontSize: 16.0),
                softWrap: true,
                overflow: TextOverflow.visible,
              ),
              const SizedBox(
                height: 20.0,
              ),
              pointList(value: "Brand Identity"),
              pointList(value: "Brand Positioning"),
              pointList(value: "Tone of Voice"),
              pointList(value: "Color Pallete"),
              pointList(value: "Typography"),
              pointList(value: "Imagery and Photography"),
              const SizedBox(
                height: 20.0,
              ),
              const SizedBox(
                height: 20.0,
              ),
              GestureDetector(
                onTap: () {},
                child: Container(
                  padding: const EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
                      color: ColorApps.secondary,
                      borderRadius: BorderRadius.circular(50.0)),
                  child: Text(
                    "Link Pendaftaran",
                    style: white500.copyWith(fontSize: 14.0),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget pointList({String value = ""}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Icon(
            Icons.panorama_fish_eye,
            size: 18.0,
          ),
          const SizedBox(
            width: 2.0,
          ),
          Text(
            "$value",
            style: black400.copyWith(fontSize: 14.0),
            softWrap: true,
            overflow: TextOverflow.visible,
          ),
        ],
      ),
    );
  }

  // Text(
  //         "$title:",
  //         style: black600.copyWith(fontSize: 16.0),
  //         softWrap: true,
  //         overflow: TextOverflow.visible,
  //       ),
  //       Text("\t\t\t\t"),
  //       Text(
  //         "$value",
  //         style: black400.copyWith(fontSize: 16.0),
  //         softWrap: true,
  //         overflow: TextOverflow.visible,
  //       ),
}
