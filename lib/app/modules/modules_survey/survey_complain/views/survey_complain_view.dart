import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:mmimobile/app/styles/color.dart';
import 'package:mmimobile/app/styles/fonts.dart';
import 'package:mmimobile/app/widget/appbar_apps_widget.dart';
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
      body: CanvaApps(
        widget: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Text(
                "Halo, apa ada yang bisa di bantu ?",
                style: black700.copyWith(fontSize: 18.0),
              ),
            ),
            const SizedBox(
              height: 20.0,
            ),
            FormAppsTwo(
              labelText: "Nama",
            ),
            // TextField(
            //   // onChanged: (value) => controller.value = value,
            //   maxLines: 1,
            //   decoration: InputDecoration(
            //     labelText: "label",
            //     filled: true,
            //     fillColor: ColorApps.card3,
            //     border: OutlineInputBorder(
            //       borderRadius: BorderRadius.circular(10.0),
            //       borderSide: BorderSide.none,
            //     ),
            //   ),
            // ),
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
              labelText: "Nama brand",
            ),
            const SizedBox(
              height: 20.0,
            ),
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
                  color: Colors.green.shade200,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: controller.file.value == null
                    ? Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.cloud_upload_outlined,
                              color: ColorApps.white, size: 40),
                          Text(
                            "Unggah file",
                            style: white500,
                          )
                        ],
                      )
                    : Image.file(controller.file.value!, fit: BoxFit.cover),
              ),
            ),
            const SizedBox(
              height: 10.0,
            ),
          ],
        ),
      ),
    );
  }
}
