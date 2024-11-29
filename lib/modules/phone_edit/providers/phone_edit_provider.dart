import 'package:flutter/widgets.dart';

class PhoneEditProvider extends ChangeNotifier {
  bool isObsecure = true;
  final passController = TextEditingController();
  final confirmPassController = TextEditingController();

  hidePass() {
    isObsecure = !isObsecure;
    notifyListeners();
  }
}
