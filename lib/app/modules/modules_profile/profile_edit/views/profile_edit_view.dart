import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:mmimobile/app/styles/color.dart';
import 'package:get/get_instance/get_instance.dart';
import '../controllers/profile_edit_controller.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:mmimobile/app/widget/canva_apps_widget.dart';
import 'package:mmimobile/app/widget/appbar_apps_widget.dart';
import 'package:mmimobile/app/widget/image_circle_widget.dart';
import 'package:mmimobile/app/widget/section_title_widget.dart';
import 'package:mmimobile/app/widget/form_apps_two_widget.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:mmimobile/app/widget/button/btn_apps_widget.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

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
            constraints: BoxConstraints(
              minHeight: constraints.maxHeight,
            ),
            child: IntrinsicHeight(
              child: CanvaApps(
                widget: SingleChildScrollView(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 18.0),
                        child: ImageCircle(
                          size: 100.0,
                        ),
                      ),
                      FormAppsTwo(
                        labelText: "Nama",
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
                      IntlPhoneField(
                        // controller: controller.phoneController.value,
                        validator: (p0) {
                          if (p0!.toString().isEmpty || p0 == "") {
                            return "Phone is required ";
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          labelText: 'Phone Number',
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: ColorApps.primary)),
                          border: OutlineInputBorder(
                            borderSide: BorderSide(),
                          ),
                        ),
                        initialCountryCode: 'ID',
                        onChanged: (phone) {
                          print(phone.completeNumber);
                        },
                      ),
                      // FormAppsTwo(
                      //   labelText: "Tanggal lahir",
                      // ),
                      SectionTittle(
                        title: "Tanggal lahir",
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),
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
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 0.0),
                        child: BtnApps(
                          onPress: () {},
                          text: "Simpan",
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
