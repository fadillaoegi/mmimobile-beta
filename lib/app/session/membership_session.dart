// ignore_for_file: avoid_print
import 'dart:convert';
import 'package:get/get.dart';
import 'package:mmimobile/app/data/models/membership/membership_data_model.dart';
import 'package:mmimobile/app/modules/modules_profile/membership/controllers/membership_data_controller.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SessionMembershipDataFLdev {
  static const membershipKey = "membershipKey";

  // NOTE: MENYIMPAN MEBERSHIP DATA
  static Future<bool> saveMembershipData(MembershipData membershipData) async {
    final prefs = await SharedPreferences.getInstance();
    Map<String, dynamic>? mapMembershipData = membershipData.toJson();
    String stringMembershipData = jsonEncode(mapMembershipData);
    bool success = await prefs.setString(membershipKey, stringMembershipData);
    if (success) {
      final controller = Get.put(MembershipDataController());
      controller.setData(membershipData);
    }
    return success;
  }

  // NOTE: GET MEBERSHIP DATA
  static Future<MembershipData?> getMembershipData() async {
    final prefs = await SharedPreferences.getInstance();
    MembershipData membership = MembershipData();
    String? stringMembershipData = prefs.get(membershipKey) as String?;
    if (stringMembershipData != null) {
      Map<String, dynamic> mapMembershipData = jsonDecode(stringMembershipData);
      membership = MembershipData.fromJson(mapMembershipData);
    }
    final controller = Get.put(MembershipDataController());
    controller.setData(membership);
    print(membership);
    return membership;
  }

  // NOTE: CLEAR USER (Logout)
  static Future<bool> clearMembershipData() async {
    final prefs = await SharedPreferences.getInstance();
    bool success = await prefs.remove(membershipKey);
    final controller = Get.put(MembershipDataController());
    controller.setData(MembershipData());
    return success;
  }
}
