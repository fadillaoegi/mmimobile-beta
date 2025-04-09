import 'package:get/get_rx/get_rx.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class DetailMembershipController extends GetxController {
  final hex = "e1c340";
  final hex2 = "6E5B1D";

  final dataMembership = [
    {
      "customer_membership_id": 1,
      "customer_membership_name": "Silver",
      "customer_membership_min": 0,
      "customer_membership_max": 1000000,
      "customer_membership_status": "1"
    },
    {
      "customer_membership_id": 2,
      "customer_membership_name": "Gold",
      "customer_membership_min": 1000000,
      "customer_membership_max": 10000000,
    },
    {
      "customer_membership_id": 3,
      "customer_membership_name": "Platinum",
      "customer_membership_min": 10000000,
      "customer_membership_max": 100000000,
    },
    {
      "customer_membership_id": 4,
      "customer_membership_name": "Prioritas",
      "customer_membership_min": 100000000,
      "customer_membership_max": 500000000,
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
