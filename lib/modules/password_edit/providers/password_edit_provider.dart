import 'package:flutter/widgets.dart';

class PasswordEditProvider extends ChangeNotifier {
  bool isObsecure = true;
  final passController = TextEditingController();
  final confirmPassController = TextEditingController();

  hidePass() {
    isObsecure = !isObsecure;
    notifyListeners();
  }
}
