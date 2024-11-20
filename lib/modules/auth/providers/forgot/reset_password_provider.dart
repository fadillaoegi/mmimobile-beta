import 'package:flutter/widgets.dart';

class ResetPasswordProvider extends ChangeNotifier {
  final passController = TextEditingController();
  final confirmPassController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey();
  bool isObsecure = true;

  void hidePass() {
    isObsecure = !isObsecure;
    notifyListeners();
  }

  resetPassword(BuildContext context) {
    if (formKey.currentState!.validate()) {
      
    }
  }
}
