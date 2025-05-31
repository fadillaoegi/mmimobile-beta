import 'package:easy_url_launcher/easy_url_launcher.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:mmimobile/app/api/api.dart';
import 'package:mmimobile/app/styles/color.dart';
import 'package:mmimobile/app/styles/fonts.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:mmimobile/app/widget/loading_widget.dart';
import '../controllers/support_detail_controller.dart';
import 'package:mmimobile/app/widget/canva_apps_widget.dart';
import 'package:mmimobile/app/widget/appbar_apps_widget.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:mmimobile/app/widget/section_title_widget.dart';

class SupportDetailView extends GetView<SupportDetailController> {
  const SupportDetailView({super.key});
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SupportDetailController());
    return Obx(
      () {
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
                      // child: Image.asset(AssetConfigFLdev.banner1)),
                      child: Image.network(
                          "${ApiApps.assetPatch}/${controller.img}")),
                  const SizedBox(
                    height: 20.0,
                  ),
                  SectionTittle(
                    // title: "Make Up Your Brand",
                    title: controller.title.toString(),
                    size: 18.0,
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  controller.desc.value.isEmpty
                      ? const Center(
                          child: Padding(
                            padding: EdgeInsets.symmetric(vertical: 20.0),
                            child: LoadingApps(),
                          ),
                        )
                      : Html(data: controller.desc.toString()),
                  const SizedBox(
                    height: 20.0,
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  GestureDetector(
                    onTap: () async {
                      await EasyLauncher.url(
                          url: controller.link.toString(),
                          mode: Mode.externalApp);
                    },
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
      },
    );
  }
}
