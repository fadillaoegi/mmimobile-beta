import 'package:flutter/material.dart';
import 'package:mmimobile/styles/fonts.dart';

class FaqScreen extends StatelessWidget {
  const FaqScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final sizeScreen = MediaQuery.sizeOf(context);
    return Scaffold(
      body: Container(
        height: sizeScreen.height,
        width: sizeScreen.width,
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Quetion ?",
              style: black600.copyWith(fontSize: 16.0),
            ),
            const SizedBox(
              height: 20.0,
            ),
            Text(
              "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only",
              style: black600.copyWith(fontSize: 13.0),
            ),
          ],
        ),
      ),
    );
  }
}
