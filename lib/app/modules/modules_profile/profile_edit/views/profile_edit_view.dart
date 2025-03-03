import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
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
    final controller = Get.put(ProfileEditController());
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
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 18.0),
                      child: ImageCircle(
                        size: 80.0,
                      ),
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
                    // FormAppsTwo(
                    //   labelText: "Tanggal lahir",
                    // ),
                    Obx(() => TextFormField(
                          readOnly: true,
                          controller: TextEditingController(
                              text: controller.selectedDate.value),
                          decoration: InputDecoration(
                            hintText: "DD-MM-YYYY",
                            suffixIcon: IconButton(
                              icon: Icon(Icons.calendar_today),
                              onPressed: () => controller.pickDate(context),
                            ),
                            border: OutlineInputBorder(),
                          ),
                        )),

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
                    SectionTittle(
                      title: "Alamat kirim",
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
