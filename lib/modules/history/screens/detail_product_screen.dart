import 'package:flutter/material.dart';

class DetailProductScreen extends StatelessWidget {
  const DetailProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final sizeScreen = MediaQuery.sizeOf(context);
    return Scaffold(
      body: Container(
        height: sizeScreen.height,
        width: sizeScreen.width,
        decoration: const BoxDecoration(),
        child: Stack(
          children: [
            Container(),
            const Column(
              children: [],
            )
          ],
        ),
      ),
    );
  }
}
