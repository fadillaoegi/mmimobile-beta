import 'dart:convert';
import 'package:mmimobile/models/user_model.dart';
import 'package:mmimobile/modules/auth/providers/user_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SessionApps {
  static Future<bool> saveUser(User dataUser, UserProvider provider) async {
    final prefs = await SharedPreferences.getInstance();
    Map<String, dynamic> mapUser = dataUser.toJson();
    String strUser = jsonEncode(mapUser);
    bool sessionSuccess = await prefs.setString("user", strUser);
    if (sessionSuccess) {
      provider.setDataUser(dataUser);
    }
    return sessionSuccess;
  }

  static Future<User> loadUser() async {
    User dataUser = User();
    final prefs = await SharedPreferences.getInstance();
    String? strUser = prefs.getString("user");
    if (strUser != null) {
      Map<String, dynamic> mapUser = jsonDecode(strUser);
      dataUser = User.fromJson(mapUser);
    }

    return dataUser;
  }

  static Future<bool> clearUser(UserProvider provider) async {
    final prefs = await SharedPreferences.getInstance();
    bool successClear = await prefs.remove("user");
    provider.setDataUser(User());

    return successClear;
  }
}
