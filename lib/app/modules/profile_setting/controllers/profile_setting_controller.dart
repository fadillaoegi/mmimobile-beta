import 'package:get/get.dart';
import 'package:mmimobile/app/configs/session_config.dart';
import 'package:mmimobile/app/routes/app_pages.dart';

class ProfileSettingController extends GetxController {
  @override
  void onInit() {
    super.onInit();
  }

  void logout() async {
    await SessionUser.clearUser(); // Hapus sesi pengguna
    Get.offAllNamed(Routes.signIn); // Arahkan ke halaman login
  }
}
