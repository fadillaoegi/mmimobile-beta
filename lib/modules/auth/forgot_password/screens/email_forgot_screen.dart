import 'package:flutter/material.dart';
import 'package:mmimobile/styles/color.dart';

class EmailForgotScreen extends StatefulWidget {
  const EmailForgotScreen({super.key});

  @override
  State<EmailForgotScreen> createState() => _EmailForgotScreenState();
}

class _EmailForgotScreenState extends State<EmailForgotScreen> {
  // final _emailController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey();
  FocusNode focusNode = FocusNode();
  @override
  Widget build(BuildContext context) {
    final sizeScreen = MediaQuery.sizeOf(context);
    return Scaffold(
      // appBar: AppBar(),
      body: GestureDetector(
        onTap: () {
          focusNode.requestFocus();
        },
        child: Container(
            height: sizeScreen.height,
            width: sizeScreen.width,
            color: ColorApps.primary,
            // color: ColorApps.white,
            child: const Column()),
      ),
    );
  }
}
