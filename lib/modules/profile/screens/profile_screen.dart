import 'package:flutter/material.dart';
import 'package:mmimobile/styles/color.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final sizeScreen = MediaQuery.sizeOf(context);
    return Scaffold(
        body: Stack(
      children: [
        Container(
          height: sizeScreen.height / 4,
          width: sizeScreen.width,
          color: ColorApps.primary,
        ),
        SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    InkWell(
                        onTap: () {},
                        child: const Icon(
                          Icons.settings,
                          color: ColorApps.white,
                        ))
                  ],
                ),
                Container(
                  width: sizeScreen.width,
                  height: sizeScreen.height / 8,
                  padding: const EdgeInsets.all(14.0),
                  decoration: const BoxDecoration(
                      color: ColorApps.white,
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      boxShadow: []),
                  child: const Column(
                    children: [
                      Text("data"),
                    ],
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    ));
  }
}
