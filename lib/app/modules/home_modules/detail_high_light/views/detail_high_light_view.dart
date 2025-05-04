import 'package:flutter/material.dart';
import 'package:mmimobile/app/api/api.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:get/get_navigation/get_navigation.dart';
import '../controllers/detail_high_light_controller.dart';
import 'package:mmimobile/app/widget/appbar_apps_widget.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';

class DetailHighLightView extends GetView<DetailHighLightController> {
  const DetailHighLightView({super.key});
  @override
  Widget build(BuildContext context) {
    final args = Get.arguments as Map<String, dynamic>;
    final sizeScreen = MediaQuery.sizeOf(context);
    return Scaffold(
        appBar: AppBarAppFLdev(
          title: args['title'].toString(),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                Image.network("${ApiApps.assetPatch}/${args['image']}"),
                Container(
                  width: sizeScreen.width,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(
                          "${ApiApps.assetPatch}/${args['image']}",
                        ),
                        filterQuality: FilterQuality.high,
                        fit: BoxFit.cover),
                  ),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                Html(
                  data: args['desc'],
                ),
              ],
            ),
          ),
        ));
  }
}
