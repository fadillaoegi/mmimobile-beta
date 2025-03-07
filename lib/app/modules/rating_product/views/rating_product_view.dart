import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:mmimobile/app/widget/appbar_apps_widget.dart';
import 'package:mmimobile/app/widget/canva_apps_widget.dart';
import 'package:mmimobile/app/widget/form_apps_two_widget.dart';
import 'package:mmimobile/app/widget/section_title_widget.dart';

import '../controllers/rating_product_controller.dart';

class RatingProductView extends GetView<RatingProductController> {
  const RatingProductView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBarAppFLdev(
          title: "Rating produk",
        ),
        body: LayoutBuilder(
          builder: (context, constraints) => SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(minHeight: constraints.maxHeight),
              child: IntrinsicHeight(
                  child: CanvaApps(
                widget: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 20.0,
                    ),
                    SectionTittle(
                      title:
                          "Berikan kritik dan saran anda untuk\npeningkatan kualitas produk kami.",
                      size: 18.0,
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    FormAppsTwo(
                      maxLines: 3,
                    )
                  ],
                ),
              )),
            ),
          ),
        ));
  }
}
