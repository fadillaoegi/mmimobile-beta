import 'package:dio/dio.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:mmimobile/app/api/api.dart';
import 'package:mmimobile/app/data/models/user_model.dart';
import 'package:mmimobile/app/data/sources/source_apps.dart';
import 'package:mmimobile/app/session/user_session.dart';

class RefreshDataFldev {
  // NOTE: REFRESH DATA USER
  static Future<void> refreshDataUser(FormData formData) async {
    final isLoading = false.obs;
    try {
      isLoading(true);
      // Ambil data terbaru dari session (bisa dari API)
      final result = await SourceApps.hitApiToMap(ApiApps.getUser, formData);
      User user = User.fromJson(result!['data']);
      SessionUserFLdev.saveUser(user);
      // User? updatedUser = await SessionUserFLdev.getUser();
    } catch (e) {
      print("Error refreshing user data: $e");
    } finally {
      isLoading(false);
    }
  }

  // NOTE: REFRESH DATA MEMBERSHIP
  static Future<void> refreshDataMembership(FormData formData, bool loading) async {
    final isLoading = false.obs;
    try {
      isLoading(true);
      // Ambil data terbaru dari session (bisa dari API)
    } catch (e) {
      print("Error refreshing membership data");
    }
  }
}
