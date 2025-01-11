import 'package:d_method/d_method.dart';
import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';
import 'package:mmimobile/api/api.dart';
import 'package:mmimobile/sources/source_apps.dart';

class ResetPasswordProvider extends ChangeNotifier {
  final passController = TextEditingController();
  final confirmPassController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey();
  bool isObsecure = true;

  void hidePass() {
    isObsecure = !isObsecure;
    notifyListeners();
  }

  void resetPassword(BuildContext context, String customerId) async {
    if (formKey.currentState!.validate()) return;

    final formData = FormData.fromMap({
      'customer_id': customerId,
      'customer_password': passController,
    });

    try {
      final result =
          await SourceApps.hitApiToMap(ApiApps.resetPassword, formData);
      result!.isNotEmpty ? result : null;
    } catch (e) {
      DMethod.printTitle("Try ~ ResetPassProvider", e.toString());
    }
  }
}
