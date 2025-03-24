import 'package:dio/dio.dart';
import 'package:mmimobile/app/api/api.dart';
import 'package:mmimobile/app/api/request_apps.dart';
import 'package:mmimobile/app/data/models/user_model.dart';

class RefreshDataFldev {
  static Future<List<User>?> refreshUser(FormData formData) async {
    final result = await RequestApp.postFutureDio(ApiApps.getUser, formData);
  }
}
