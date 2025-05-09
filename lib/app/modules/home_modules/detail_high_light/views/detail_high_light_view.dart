import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:get/instance_manager.dart';
import 'package:mmimobile/app/api/api.dart';
import 'package:flutter_html/flutter_html.dart';
import '../controllers/detail_high_light_controller.dart';
import 'package:mmimobile/app/widget/appbar_apps_widget.dart';

class DetailHighLightView extends GetView<DetailHighLightController> {
  const DetailHighLightView({super.key});
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(DetailHighLightController());
    return Obx(
      () => Scaffold(
        appBar: AppBarAppFLdev(
          title: controller.title.toString(),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(14.0),
            child: Column(
              children: [
                Image.network("${ApiApps.assetPatch}/${controller.img}"),
                const SizedBox(
                  height: 10.0,
                ),
                Html(
                  // data: args['desc'],
                  data: controller.desc.toString(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
