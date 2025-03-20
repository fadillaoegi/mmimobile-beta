import 'package:get/get.dart';
import 'package:mmimobile/app/session/user_session.dart';
import 'package:mmimobile/app/routes/app_pages.dart';

class ProfileSettingController extends GetxController {
  @override
  void onInit() {
    super.onInit();
  }

  void logout() async {
    await SessionUserFLdev.clearUser(); // Hapus sesi pengguna
    Get.offAllNamed(Routes.signIn); // Arahkan ke halaman login
  }
}
