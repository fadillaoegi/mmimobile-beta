import 'package:get/get.dart';

class SupportDetailController extends GetxController {
  final id = ''.obs;
  final title = ''.obs;
  final desc = ''.obs;
  final img = ''.obs;
  final link = ''.obs;

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
    final args = Get.arguments as Map<String, dynamic>;
    id.value = args['id'].toString();
    title.value = args['title'].toString();
    desc.value = args['desc'].toString();
    img.value = args['img'].toString();
    link.value = args['link'].toString();
  }
}
