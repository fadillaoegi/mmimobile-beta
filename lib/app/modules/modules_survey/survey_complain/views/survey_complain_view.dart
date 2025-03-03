import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:mmimobile/app/styles/color.dart';
import 'package:mmimobile/app/styles/fonts.dart';
import 'package:mmimobile/app/widget/appbar_apps_widget.dart';
import 'package:mmimobile/app/widget/button/btn_apps_widget.dart';
import 'package:mmimobile/app/widget/canva_apps_widget.dart';
import 'package:mmimobile/app/widget/form_apps_two_widget.dart';
import 'package:mmimobile/app/widget/section_title_widget.dart';
import '../controllers/survey_complain_controller.dart';

class SurveyComplainView extends GetView<SurveyComplainController> {
  const SurveyComplainView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBarAppFLdev(
          title: "Layanan komplain",
        ),
        body: LayoutBuilder(
          builder: (context, constraints) => SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: constraints.maxHeight,
              ),
              child: IntrinsicHeight(
                child: CanvaApps(
                  widget: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 20.0),
                        child: Center(
                          child: Text(
                            "Halo, apa ada yang bisa di bantu ?",
                            style: black500.copyWith(fontSize: 18.0),
                          ),
                        ),
                      ),
                      // NOTE: NAME
                      FormAppsTwo(
                        labelText: "Nama",
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),

                      // NOTE: EMAIL FORM
                      FormAppsTwo(
                        labelText: "Email",
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),

                      // NOTE: BRAND NAME FORM
                      FormAppsTwo(
                        labelText: "Nama brand",
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),

                      // NOTE: IMAGE PICKER FORM
                      SectionTittle(
                        title: "Unggah gambar",
                      ),
                      const SizedBox(height: 10.0),
                      GestureDetector(
                        onTap: () => controller.pickImage(),
                        child: Container(
                          height: 100,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: ColorApps.card2,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: controller.file.value == null
                              ? Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(Icons.cloud_upload_outlined,
                                        color: ColorApps.disable2, size: 40),
                                    Text(
                                      "Unggah file",
                                      // style: white500,
                                      style: disable2400,
                                    )
                                  ],
                                )
                              : Image.file(controller.file.value!,
                                  fit: BoxFit.cover),
                        ),
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      // NOTE: TELLING PROBLEM FORM
                      SectionTittle(
                        title: "Ceritakan kendala yang anda alami",
                      ),
                      const SizedBox(height: 10.0),

                      FormAppsTwo(
                        maxLines: 5,
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      BtnApps(
                        onPress: () {},
                        text: "Kirim",
                        color: ColorApps.card3,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ));
  }
}
