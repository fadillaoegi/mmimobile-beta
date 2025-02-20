import 'package:d_method/d_method.dart';
import 'package:dio/dio.dart';

class RequestApp {
  static final dio = Dio();
  static const headerKey = "GS-KEY";
  static const headerValue = "8g0kc4skc0gc40kkgcskw40kgg0k84ssgcs4ss4w";
  static const apiKey = "";
  static Future<Response?> getFutureDio(String url) async {
    try {
      Response dioRes = await dio.get(
        url,
        options: Options(
          headers: {headerKey: headerValue},
          sendTimeout: const Duration(seconds: 10),
          receiveTimeout: const Duration(seconds: 10),
        ),
      );
      DMethod.printTitle("Try ~ $url", dioRes.data.toString());
      return dioRes;
    } on DioException catch (e) {
      DMethod.printTitle("Error ~ $url", e.toString());
      return null;
    } catch (e) {
      DMethod.printTitle("Try ~ $url", e.toString());

      return null;
    }
  }

  static Future<Response?> postFutureDio(String url, FormData formData) async {
    // try {
      Response dioRes = await dio.post(
        url,
        data: formData,
        options: Options(
          headers: {
            headerKey: headerValue,
          },
          sendTimeout: const Duration(seconds: 10),
          receiveTimeout: const Duration(seconds: 10),
        ),
      );
      DMethod.printTitle("Try ~ $url", dioRes.data.toString());
      return dioRes;
    // } on DioException catch (e) {
    //   DMethod.printTitle("Try ~ $url", e.toString());
    // } catch (e) {
    //   DMethod.printTitle("Try ~ $url", e.toString());
    //   return null;
    // }
    // return null;
  }
}
