import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:mmimobile/app/configs/session_config.dart';
import 'package:mmimobile/app/data/models/user_model.dart';
import 'package:mmimobile/app/modules/auth/data/controller/user_controller.dart';
import 'package:mmimobile/app/routes/app_pages.dart';

class SplashController extends GetxController {
  final user = Get.put(UserController());
  RxString message = "Loading...".obs;

  // NOTE: OVERRIDE
  @override
  void onInit() {
    super.onInit();
    startSplash();
  }

  // NOTE: FUNCTION
  Future<void> startSplash() async {
    try {
      // STEP 1: Display initial loading message
      message.value = "Loading...";
      await Future.delayed(const Duration(seconds: 2));

      // STEP 2: Update message for session check
      message.value = "Checking user session...";
      await Future.delayed(const Duration(seconds: 2));

      // STEP 3: Check user session
      User? currentUser = await SessionUser.getUser();
      if (currentUser!.customerId != null) {
        print(currentUser.customerId);
        print(currentUser.customerName);
        Get.offAllNamed(Routes.appMain);
      } else {
        Get.offAllNamed(Routes.signIn);
      }
    } catch (e) {
      message.value = "An error occurred, please restart the app.";
      Get.snackbar(
        "Error",
        "Failed to load session. Please try again.",
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }
}
