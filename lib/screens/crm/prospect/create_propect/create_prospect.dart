import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mir_expense_tracker/Utils/app_colors/app_color.dart';
import 'package:mir_expense_tracker/Widget/custom_text_field.dart';
import 'package:mir_expense_tracker/constants.dart';
import 'package:mir_expense_tracker/controllers/MenuAppController.dart';
import 'package:mir_expense_tracker/routes/app_pages.dart';
import 'package:mir_expense_tracker/screens/auth/controller/auth_controller.dart';
import 'package:mir_expense_tracker/screens/crm/prospect/controller/prospect_controller.dart';
import 'package:provider/provider.dart';

import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';

class CreateProspectForm extends GetView<ProspectController> {
  @override
  Widget build(BuildContext context) {


    var size = MediaQuery.of(context).size;
    return Scaffold(
        key: context.read<MenuAppController>().scaffoldKeyAddProspect,

        body: Obx(() {
      return SingleChildScrollView(
        child: Container(
          width: size.width,
          height: size.height * 1.5,
          child: SafeArea(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Add Prospect Name",
                  ),
                  CustomTextInput(
                    textController: controller.nameController.value,
                    hintText: "Prospect Title",
                    keybrdType: true,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Mobile",
                    // style: Get.theme.textTheme.bodySmall,
                  ),
                  CustomTextInput(
                    textController: controller.mobileController.value,
                    hintText: "Mobile",
                    keybrdType: false,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text("Email"),
                  CustomTextInput(
                    textController: controller.emailController.value,
                    hintText: "Email",
                    keybrdType: true,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Address",
                    // style: Get.theme.textTheme.bodySmall,
                  ),
                  CustomTextInput(
                    textController: controller.addressController.value,
                    hintText: "Address",
                    keybrdType: true,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Note",
                    // style: Get.theme.textTheme.bodySmall,
                  ),
                  CustomTextInput(
                    textController: controller.noteController.value,
                    hintText: "Keep a note for this prospect",
                    keybrdType: true,
                  ),

                  SizedBox(
                    height: 20,
                  ),
                  GestureDetector(
                    onTap: () {
                      controller.addProspectController().then((e) {
                        print("prospect added");

                        controller.retrieveProspect().then((value) {
                          return controller.prospectList.value = value;

                        }).then((value) {
                          Get.toNamed(Routes.PROSPECTFRONT);
                        });
                      });
                    },
                    child: Container(
                      height: 60,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.circular(6),
                          border:
                          Border.all(color: Colors.grey.withOpacity(.35))),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Center(
                          child: Text(
                            'Add Prospect',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    }));
  }
}
