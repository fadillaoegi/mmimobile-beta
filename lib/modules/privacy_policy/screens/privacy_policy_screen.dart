import 'package:flutter/material.dart';
import 'package:mmimobile/styles/fonts.dart';
import 'package:mmimobile/widget/faq/item_faq_widget.dart';

class PrivacyPolicyScreen extends StatelessWidget {
  const PrivacyPolicyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final sizeScreen = MediaQuery.sizeOf(context);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title:
            Text("Privacy Policy", style: primary700.copyWith(fontSize: 20.0)),
        scrolledUnderElevation: 0.0,
      ),
      body: Container(
        height: sizeScreen.height,
        width: sizeScreen.width,
        padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
        child: ListView.builder(
          itemCount: 10,
          itemBuilder: (context, index) => const ItemFaq(),
        ),
      ),
    );
  }
}
