import 'package:d_method/d_method.dart';
import 'package:dio/dio.dart';
import 'package:mmimobile/api/api.dart';
import 'package:mmimobile/api/request_apps.dart';

class AuthSource {
  static Future<bool> login(FormData formdata) async {
    try {
      const url = ApiApps.login;
      final result = await RequestApp.postFutureDio(url, formdata);
      print(result);

      if (result == null) return false;

      if (result["success"]) {
        // var mapUser = result["data"];
        // print("Data user dari AuthSource: $mapUser");
        // SessionUser.saveUser(User.fromJson(mapUser));
        return true;
      } else {
        // Get.snackbar("Login Gagal", result["message"] ?? "Email atau Password Salah");
        return false;
      }
    } catch (e) {
      DMethod.printTitle("Error ~ sourceAuthLogin", e.toString());
      // Get.snackbar("Error", "Terjadi kesalahan pada server");
      return false;
    }
  }
}
