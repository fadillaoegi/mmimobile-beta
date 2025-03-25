import 'package:get/get.dart';

class DetailMembershipController extends GetxController {
  final categoryMembership = ["Silver", "Gold", "Platinum", "Prioritas"].obs;
  final selectedCategory = "Silver".obs;
  @override
  void onInit() {
    super.onInit();
  }

  void setCategory(String category) {
    selectedCategory.value = category;
  }
}
