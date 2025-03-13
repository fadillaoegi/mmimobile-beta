import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:mmimobile/app/styles/color.dart';
import 'package:mmimobile/app/styles/fonts.dart';
import 'package:get/get_instance/get_instance.dart';
import '../controllers/profile_edit_controller.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:mmimobile/app/widget/canva_apps_widget.dart';
import 'package:mmimobile/app/widget/appbar_apps_widget.dart';
import 'package:mmimobile/app/widget/image_circle_widget.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:mmimobile/app/widget/section_title_widget.dart';
import 'package:mmimobile/app/widget/button/btn_apps_widget.dart';
import 'package:mmimobile/app/widget/form/form_apps_fldev_widget.dart';

class ProfileEditView extends GetView<ProfileEditController> {
  const ProfileEditView({super.key});
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ProfileEditController());
    return Scaffold(
      appBar: AppBarAppFLdev(
        title: "Ubah profil",
      ),
      body: CanvaApps(
        widget: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 18.0),
                child: ImageCircle(
                  size: 100.0,
                ),
              ),
              FormAppsFLdev(
                // labelText: userData.user.customerName.toString(),
                labelText: "Nama",
                controller: controller.nameController,
              ),
              const SizedBox(
                height: 20.0,
              ),
              FormAppsFLdev(
                // labelText: userData.user.customerEmail.toString(),
                labelText: "Email",
                controller: controller.emailController,
                readOnly: true,
              ),
              const SizedBox(
                height: 20.0,
              ),
              IntlPhoneField(
                // controller: controller.phoneController.value,
                controller: controller.phoneController,
                validator: (p0) {
                  if (p0!.toString().isEmpty || p0 == "") {
                    return "Phone is required ";
                  }
                  return null;
                },
                readOnly: true,
                decoration: InputDecoration(
                  labelText: 'Nomor telp',
                  fillColor: ColorApps.white,
                  filled: true,
                  enabledBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: ColorApps.disable, width: 2.0)),
                  focusedBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: ColorApps.secondary, width: 2.0)),
                  border: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: ColorApps.secondary, width: 2.0),
                  ),
                ),
                initialCountryCode: 'ID',
                onChanged: (phone) {
                  print(phone.completeNumber);
                },
              ),
              SectionTittle(
                title: "Tanggal lahir",
              ),
              const SizedBox(
                height: 10.0,
              ),
              TextFormField(
                readOnly: true,
                controller: controller.bornController,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: ColorApps.white,
                  labelStyle: secondary500,
                  enabledBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: ColorApps.disable, width: 2.0)),
                  focusedBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: ColorApps.secondary, width: 2.0)),
                  suffixIcon: IconButton(
                    icon: Icon(Icons.calendar_today),
                    onPressed: () => controller.pickDate(context),
                  ),
                  border: OutlineInputBorder(),
                ),
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
              FormAppsFLdev(
                maxLines: 3,
                controller: controller.addressController,
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
              FormAppsFLdev(
                maxLines: 3,
                controller: controller.addressSendController,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20.0),
                child: BtnApps(
                  onPress: () {},
                  text: "Simpan",
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
