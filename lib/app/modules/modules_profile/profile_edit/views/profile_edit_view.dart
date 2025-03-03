import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:mmimobile/app/widget/appbar_apps_widget.dart';
import 'package:mmimobile/app/widget/canva_apps_widget.dart';
import 'package:mmimobile/app/widget/form_apps_two_widget.dart';
import 'package:mmimobile/app/widget/image_circle_widget.dart';
import 'package:mmimobile/app/widget/section_title_widget.dart';

import '../controllers/profile_edit_controller.dart';

class ProfileEditView extends GetView<ProfileEditController> {
  const ProfileEditView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarAppFLdev(
        title: "Ubah profil",
      ),
      body: LayoutBuilder(
        builder: (context, constraints) => SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(minHeight: constraints.maxHeight),
            child: IntrinsicHeight(
              child: CanvaApps(
                widget: Column(
                  children: [
                    ImageCircle(
                      size: 80.0,
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    FormAppsTwo(
                      labelText: "Email",
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    FormAppsTwo(
                      labelText: "Nama",
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    FormAppsTwo(
                      labelText: "Tanggal lahir",
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    SectionTittle(
                      title: "Alamat penagihan",
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    FormAppsTwo(
                      maxLines: 3,
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    FormAppsTwo(
                      labelText: "Nama",
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    FormAppsTwo(
                      labelText: "Nama",
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
