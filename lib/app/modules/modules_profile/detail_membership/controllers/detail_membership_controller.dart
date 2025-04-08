import 'package:get/get_rx/get_rx.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class DetailMembershipController extends GetxController {
  final dataMembership = [
    {
      "id": 1,
      "name": "Silver",
      "min": 0,
      "max": 1000000,
    },
    {
      "id": 2,
      "name": "Gold",
      "min": 1000000,
      "max": 10000000,
    },
    {
      "id": 3,
      "name": "Platinum",
      "min": 10000000,
      "max": 100000000,
    },
    {
      "id": 4,
      "name": "Prioritas",
      "min": 100000000,
      "max": 500000000,
    },
  ].obs;
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
