import 'package:flutter/material.dart';
import 'package:mmimobile/configs/asset_config.dart';
import 'package:mmimobile/routes/initial_routes.dart';
import 'package:mmimobile/styles/color.dart';
import 'package:mmimobile/styles/fonts.dart';
import 'package:mmimobile/styles/shadow.dart';
import 'package:mmimobile/widget/alert/alert_dialog_widget.dart';
import 'package:mmimobile/widget/image_circle_widget.dart';
import 'package:mmimobile/widget/item_list_widget.dart';

class ProfileSettingScreen extends StatelessWidget {
  const ProfileSettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final sizeScreen = MediaQuery.sizeOf(context);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title:
            Text("Setting Profile", style: primary700.copyWith(fontSize: 20.0)),
        scrolledUnderElevation: 0.0,
      ),
      body: SingleChildScrollView(
        child: Container(
          width: sizeScreen.width,
          margin: const EdgeInsets.symmetric(horizontal: 10.0),
          padding: const EdgeInsets.symmetric(horizontal: 14.0),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              color: ColorApps.white,
              boxShadow: boxShadow),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 20.0,
              ),
              const ImageCircle(
                size: 100.0,
              ),
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
                onTap: () {
                  Navigator.pushNamed(context, RouteScreen.profileEdit);
                },
                label: "Edit Profile",
                icon: Icons.person,
              ),
              ItemList(
                onTap: () {
                  Navigator.pushNamed(context, RouteScreen.editPassword);
                },
                label: "Edit Password",
                icon: Icons.lock_outline,
              ),
              ItemList(
                onTap: () {
                  Navigator.pushNamed(context, RouteScreen.phoneEdit);
                },
                label: "Edit Phone Number",
                icon: Icons.phone_android,
              ),
              ItemList(
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialogApps(
                      onTap: () {
                        Navigator.pushNamedAndRemoveUntil(
                          context,
                          RouteScreen.signIn,
                          (route) => false,
                        );
                      },
                      lotties: AssetConfig.lottieDelete,
                      title: "Are you sure ?",
                      content: "Delete Account",
                      textBtn: "Yes",
                    ),
                  );
                },
                label: "Delete Account",
                icon: Icons.delete_forever_outlined,
              ),
              ItemList(
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialogApps(
                      onTap: () {
                        Navigator.pushNamedAndRemoveUntil(
                          context,
                          RouteScreen.signIn,
                          (route) => false,
                        );
                      },
                      lotties: AssetConfig.lottieLogout2,
                      title: "Are you sure ?",
                      content: "Sign Out",
                      textBtn: "Yes",
                    ),
                  );
                },
                label: "Sign Out",
                icon: Icons.logout,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
