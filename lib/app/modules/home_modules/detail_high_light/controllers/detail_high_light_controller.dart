import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class DetailHighLightController extends GetxController {
  final img = ''.obs;
  final desc = ''.obs;
  final title = ''.obs;
  @override
  void onInit() {
    super.onInit();
    final args = Get.arguments as Map<String, dynamic>;
    title.value = args['title'].toString();
    img.value = args['image'].toString();
    desc.value = args['desc'].toString();
  }
}
