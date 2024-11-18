import 'package:flutter/widgets.dart';

class OtpForgotProvider extends ChangeNotifier {
  final otpCodeC = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey();
  FocusNode focusNode = FocusNode();
  String staticCode = "000000";
}
