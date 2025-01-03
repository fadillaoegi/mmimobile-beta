import 'package:d_method/d_method.dart';
import 'package:dio/dio.dart';
import 'package:mmimobile/api/api.dart';
import 'package:mmimobile/api/request_apps.dart';

class AuthSource {
  static Future<bool> signIn(FormData formdata) async {
    try {
      const url = ApiApps.signIn;
      final result = await RequestApp.postFutureDio(url, formdata);
      print("from source $result");

      if (result == null) return false;

      final mapUser = result.data;
      if (result.statusCode == 200) {
        print("Data user dari AuthSource: $mapUser");
        return true;
      } else {
        print("Data user dari AuthSource: $mapUser");
        // Get.snackbar("Login Gagal", result["message"] ?? "Email atau Password Salah");
        return false;
      }
    } on DioException catch (error) {
      DMethod.printTitle("Error ~ sourceAuthLogin", error.toString());
      return false;
    } catch (e) {
      DMethod.printTitle("Error ~ sourceAuthLogin", e.toString());
      // Get.snackbar("Error", "Terjadi kesalahan pada server");
      return false;
    }
  }
}
