import 'package:flutter/material.dart';
import 'package:mmimobile/modules/faq/providers/faq_provider.dart';
import 'package:mmimobile/styles/fonts.dart';
import 'package:mmimobile/widget/faq/item_faq_widget.dart';
import 'package:provider/provider.dart';

class FaqScreen extends StatelessWidget {
  const FaqScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final faqProvider = Provider.of<FaqProvider>(context);
    final sizeScreen = MediaQuery.sizeOf(context);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("FAQ", style: primary700.copyWith(fontSize: 20.0)),
        scrolledUnderElevation: 0.0,
      ),
      body: Container(
        height: sizeScreen.height,
        width: sizeScreen.width,
        padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
        child: ListView.builder(
          itemCount: faqProvider.dataFaq.length,
          itemBuilder: (context, index) => ItemFaq(
            title: faqProvider.dataFaq[index]["title"],
            desc: faqProvider.dataFaq[index]["desc"],
          ),
        ),
      ),
    );
  }
}
