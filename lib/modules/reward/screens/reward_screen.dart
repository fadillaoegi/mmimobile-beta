import 'package:flutter/material.dart';

class RewardScreen extends StatelessWidget {
  const RewardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final sizeScreen = MediaQuery.sizeOf(context);
    return Scaffold(
        body: Stack(
      children: [
        Container(
          height: sizeScreen.height,
          width: sizeScreen.width,
          decoration: const BoxDecoration(),
        ),
         Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

          ],
        ),
      ],
    ));
  }
}
