import 'package:get/get_rx/get_rx.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:mmimobile/app/widget/snackbar_wiget.dart';

class MembershipController extends GetxController {
  final count = 0.obs;
  final privilage = false.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  claimPrivilage() {
    privilage.value = true;
    privilage.value
        ? SnackbarFLdev.snackShow(
            title: "Hak istimewa diambil", message: "Silahkan pakai")
        : null;
    update();
  }

  void increment() => count.value++;
}
