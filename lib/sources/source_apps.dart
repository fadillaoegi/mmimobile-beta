import 'dart:async';
import 'package:dio/dio.dart';
import 'package:d_method/d_method.dart';
import 'package:mmimobile/api/request_apps.dart';

class SourceApps {
  static Future<Map<String, dynamic>?> hitApiToMap(
    String url,
    FormData formdata,
  ) async {
    try {
      // const url = ApiApps.signIn;
      final result = await RequestApp.postFutureDio(url, formdata);
      print("from source $result");
      if (result!.statusCode == 200) {
        Map<String, dynamic> mapUser = result.data;
        final data = mapUser.isEmpty ? null : mapUser;
        return data;
      }

      return null;
    } on DioException catch (e) {
      DMethod.printTitle("Error ~ sourceAuthLogin", e.toString());
      return null;
    }
  }
}
