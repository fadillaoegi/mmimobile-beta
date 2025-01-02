import 'dart:convert';

import 'package:d_method/d_method.dart';
import 'package:dio/dio.dart';

class RequestApps {
  static final dio = Dio();
  static const headerKey = "";
  static const apiKey = "";
  static Future<Map?> getFutureDio(String url) async {
    try {
      Response dioRes = await dio.get(
        url,
        // options: Options(
        //   headers: {headerKey: url},
        // ),
      );
      DMethod.printTitle("Try ~ $url", dioRes.data.toString());
      if (dioRes.statusCode == 200) {
        DMethod.printTitle(
            "Try ~ $url : ", "Status ${dioRes.statusCode}: Success");
        Map? resBody = jsonDecode(dioRes.data);
        return resBody;
      }
    } catch (e) {
      DMethod.printTitle("Try ~ $url", e.toString());

      return null;
    }
    return null;
  }
}
