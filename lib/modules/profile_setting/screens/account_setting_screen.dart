import 'package:flutter/material.dart';
import 'package:mmimobile/styles/fonts.dart';
import 'package:mmimobile/widget/image_circle_widget.dart';
import 'package:mmimobile/widget/item_list_widget.dart';

class ProfileSettingScreen extends StatelessWidget {
  const ProfileSettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final sizeScreen = MediaQuery.sizeOf(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Account Settings",
          style: primary700.copyWith(fontSize: 20.0),
        ),
        scrolledUnderElevation: 0.0,
      ),
      body: Container(
        height: sizeScreen.height,
        width: sizeScreen.width,
        padding: const EdgeInsets.symmetric(horizontal: 14.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const ImageCircle(),
            const SizedBox(
              height: 10.0,
            ),
            TextButton(
              onPressed: () {},
              child: Text(
                "Edit Photo",
                style: disable2500.copyWith(fontSize: 14.0),
              ),
            ),
            const SizedBox(
              height: 20.0,
            ),
            ItemList(
              onTap: () {},
              label: "Edit Profile",
              icon: Icons.person,
            ),
            ItemList(
              onTap: () {},
              label: "Edit Password",
              icon: Icons.lock_outline,
            ),
            ItemList(
              onTap: () {},
              label: "Edit Phone Number",
              icon: Icons.phone_android,
            ),
            ItemList(
              onTap: () {},
              label: "Delete Account",
              icon: Icons.delete_forever_outlined,
            ),
            ItemList(
              onTap: () {},
              label: "Sign Out",
              icon: Icons.logout,
            ),
          ],
        ),
      ),
    );
  }
}
