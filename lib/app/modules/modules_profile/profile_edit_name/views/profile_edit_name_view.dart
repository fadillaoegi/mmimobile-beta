import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:mmimobile/app/styles/color.dart';
import 'package:mmimobile/app/styles/fonts.dart';
import 'package:mmimobile/app/styles/shadow.dart';
import 'package:get/get_instance/get_instance.dart';
import '../controllers/profile_edit_name_controller.dart';
import 'package:mmimobile/app/widget/form_apps_two_widget.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:mmimobile/app/modules/modules_auth/data/controller/user_controller.dart';

class ProfileEditNameView extends GetView<ProfileEditNameController> {
  const ProfileEditNameView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ProfileEditNameController());
    final userController = Get.put(UserController());
    final customerId = userController.user.customerId as String;
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Edit Name',
                style: primary500,
              ),
              IconButton(
                  onPressed: () => controller.editName(context, customerId),
                  icon: Icon(
                    Icons.check,
                    color: ColorApps.primary,
                    size: 28.0,
                  ))
            ],
          ),
          centerTitle: true,
        ),
        body: LayoutBuilder(
          builder: (context, constraints) => SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(minHeight: constraints.maxHeight),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    Container(
                        padding: const EdgeInsets.all(14.0),
                        width: constraints.maxWidth,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            color: ColorApps.white,
                            boxShadow: boxShadow),
                        child: Form(
                          key: controller.formKey,
                          child: Column(
                            children: [
                              Obx(
                                () => FormAppsTwo(
                                  controller:
                                      controller.newNameController.value,
                                  labelText: userController.user.customerName
                                      .toString(),
                                  validator: (p0) {
                                    if (p0!.isEmpty) {
                                      return "you haven't made any changes";
                                    } else if (p0.length <= 5) {
                                      return "Name must contain at least 5 characters";
                                    }
                                    return null;
                                  },
                                ),
                              ),
                              const SizedBox(
                                height: 20.0,
                              ),
                            ],
                          ),
                        )),
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
