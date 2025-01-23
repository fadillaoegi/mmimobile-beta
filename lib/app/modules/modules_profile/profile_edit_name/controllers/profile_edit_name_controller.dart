import 'package:d_method/d_method.dart';
import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:mmimobile/app/api/api.dart';
import 'package:mmimobile/app/data/sources/source_apps.dart';

class ProfileEditNameController extends GetxController {
  final count = 0.obs;
  final newNameController = TextEditingController().obs;
  final passController = TextEditingController().obs;
  final GlobalKey<FormState> formKey = GlobalKey();
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  editName(BuildContext context, customerId) async {
    if (formKey.currentState!.validate()) {
      final customerName = newNameController.value.text.trim();
      final password = newNameController.value.text.trim();
      final formData = FormData.fromMap({
        'customer_id': customerId,
        'customer_password': password,
        'customer_name': customerName,
      });

      try {
        final result =
            await SourceApps.hitApiToMap(ApiApps.updateName, formData);
        if (result!['status']) {}
      } catch (e) {
        DMethod.printTitle('Try ~ fromProfileNameController', e.toString());
      }
    }
  }
}
