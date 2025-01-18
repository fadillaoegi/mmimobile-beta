import 'package:d_method/d_method.dart';
import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:mmimobile/app/api/api.dart';
import 'package:mmimobile/app/data/sources/source_apps.dart';

class AddEmailController extends GetxController {
  final emailController = TextEditingController().obs;
  final GlobalKey<FormState> formKey = GlobalKey();
  final focusNode = FocusNode().obs;
  @override
  void onInit() {
    super.onInit();
  }

  addEmail(BuildContext context, String customerId) async {
    final email = emailController.value.text.trim();
    final formData = FormData.fromMap({
      'customer_id': customerId,
      'customer_email': email,
      'type': 'add',
    });
    try {
      if (formKey.currentState!.validate()) {
        final result =
            await SourceApps.hitApiToMap(ApiApps.updateEmail, formData);
        result ?? result;

        // if (email == result['customer_email']) {
          
        // }
      }
    } catch (e) {
      DMethod.printTitle("Try~controllerEmail", e.toString());
    }
  }
}
