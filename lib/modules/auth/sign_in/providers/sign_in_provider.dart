import 'package:flutter/widgets.dart';

class SignInProvider extends ChangeNotifier {
  FocusNode focusNode = FocusNode();
  final GlobalKey<FormState> formKey = GlobalKey();
  final emailController = TextEditingController();
  final passController = TextEditingController();
  bool isObsecure = true;

  // NOTE: DATA STATIS
  final _emailStatic = "example@gmail.com";
  String get email => _emailStatic;
  final _passwordStatic = "11111111";
  String get password => _passwordStatic;
}
