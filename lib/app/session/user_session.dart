// ignore_for_file: avoid_print
import 'dart:convert';
import 'package:get/get.dart';
import 'package:mmimobile/app/data/models/user_model.dart';
import 'package:mmimobile/app/modules/modules_auth/data/controller/user_controller.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SessionUserFLdev {
  static const userKey = "userKey";

  // NOTE: MENYIMPAN USER LOGIN?REGISTER
  static Future<bool> saveUser(User user) async {
    final prefs = await SharedPreferences.getInstance();
    Map<String, dynamic>? mapUser = user.toJson();
    String stringUser = jsonEncode(mapUser);
    bool success = await prefs.setString(userKey, stringUser);
    if (success) {
      final controllUser = Get.put(UserController());
      controllUser.setData(user);
    }
    return success;
  }

  // NOTE: GET USER
  static Future<User?> getUser() async {
    final prefs = await SharedPreferences.getInstance();
    User user = User();
    String? stringUser = prefs.get(userKey) as String?;
    if (stringUser != null) {
      Map<String, dynamic> mapUser = jsonDecode(stringUser);
      user = User.fromJson(mapUser);
    }
    final controllUser = Get.put(UserController());
    controllUser.setData(user);
    print(user);
    return user;
  }

  // NOTE: CLEAR USER (Logout)
  static Future<bool> clearUser() async {
    final prefs = await SharedPreferences.getInstance();
    bool success = await prefs.remove(userKey);
    final controller = Get.put(UserController());
    controller.setData(User());
    return success;
  }
}
