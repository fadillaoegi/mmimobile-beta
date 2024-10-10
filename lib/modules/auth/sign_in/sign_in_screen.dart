import 'package:flutter/material.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  // final emailController = TextEditingController();
  // final passController = TextEditingController();
  // final telpController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.sizeOf(context);

    return Scaffold(
      body: SizedBox(
        height:screenSize.height, width:screenSize.width,
        

      ),
    );
  }
}
