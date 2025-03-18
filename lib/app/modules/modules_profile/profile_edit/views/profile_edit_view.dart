import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:mmimobile/app/styles/color.dart';
import 'package:mmimobile/app/widget/canva_apps_widget.dart';
import 'package:mmimobile/app/widget/appbar_apps_widget.dart';
import 'package:mmimobile/app/widget/image_circle_widget.dart';
import 'package:mmimobile/app/widget/section_title_widget.dart';
import 'package:mmimobile/app/widget/button/btn_apps_widget.dart';
import 'package:mmimobile/app/widget/form/form_apps_fldev_widget.dart';
import '../controllers/profile_edit_controller.dart';

class ProfileEditView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ProfileEditController());

    return Scaffold(
      appBar: AppBarAppFLdev(title: "Ubah Profil"),
      body: CanvaApps(
        widget: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 18.0),
                child: Obx(() {
                  return ImageCircle(
                    onTap: () {
                      Get.dialog(
                        AlertDialog(
                          content: Container(
                            padding: const EdgeInsets.all(10.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                IconButton(
                                  onPressed: () {
                                    controller.pickImage(ImageSource.camera);
                                    Get.back();
                                  },
                                  icon: Icon(Icons.camera_alt_outlined,
                                      size: 60.0),
                                ),
                                IconButton(
                                  onPressed: () {
                                    controller.pickImage(ImageSource.gallery);
                                    Get.back();
                                  },
                                  icon: Icon(Icons.photo_outlined, size: 60.0),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                    size: 100.0,
                    imageUrl: controller.selectedImagePath.value ??
                        controller.userData.user.customerPhotoProfil ??
                        "https://raw.githubusercontent.com/fadillaoegi/APIMyAssets/refs/heads/master/logo/logo.png",
                  );
                }),
              ),
              const SizedBox(height: 20.0),
              IntlPhoneField(
                readOnly: true,
                keyboardType: TextInputType.phone,
                validator: (p0) {
                  if (p0!.toString().isEmpty || p0 == "") {
                    return "Nomor harus di isi";
                  }
                  return null;
                },
                showCursor: false,
                decoration: InputDecoration(
                  // labelText: controller.phoneController.value.text,
                  hintText: "${controller.phoneController.value.text}",
                  fillColor: const Color.fromARGB(137, 175, 175, 175),
                  filled: true,
                  enabledBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: ColorApps.disable, width: 2.0)),
                  focusedBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: ColorApps.disable, width: 2.0)),
                  border: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: ColorApps.secondary, width: 2.0),
                  ),
                ),
                initialCountryCode: 'ID',
                onChanged: (phone) {
                  print(controller.phoneController.value.text);
                },
              ),
              const SizedBox(height: 20.0),
              FormAppsFLdev(
                  labelText: "Nama", controller: controller.nameController),
              const SizedBox(height: 20.0),
              FormAppsFLdev(
                  labelText: "Email",
                  controller: controller.emailController,
                  readOnly: true),
              const SizedBox(height: 20.0),
              TextFormField(
                controller: controller.bornController,
                onChanged: (value) {},
                readOnly: true,
                decoration: InputDecoration(
                  labelText: "Tanggal Lahir",
                  fillColor: ColorApps.white,
                  filled: true,
                  suffixIcon: IconButton(
                    icon: Icon(Icons.calendar_today),
                    onPressed: () => controller.selectDate(context),
                  ),
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
              ),
              const SizedBox(height: 20.0),
              SectionTittle(title: "Alamat Penagihan"),
              const SizedBox(height: 6.0),
              FormAppsFLdev(
                  maxLines: 3, controller: controller.addressController),
              const SizedBox(height: 20.0),
              SectionTittle(title: "Alamat Kirim"),
              const SizedBox(height: 6.0),
              FormAppsFLdev(
                  maxLines: 3, controller: controller.addressSendController),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20.0),
                child: BtnApps(
                  onPress: () => controller.updateProfile(),
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
