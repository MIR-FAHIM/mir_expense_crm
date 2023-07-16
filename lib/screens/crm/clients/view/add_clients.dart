import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mir_expense_tracker/Utils/app_colors/app_color.dart';
import 'package:mir_expense_tracker/Widget/custom_text_field.dart';
import 'package:mir_expense_tracker/constants.dart';
import 'package:mir_expense_tracker/routes/app_pages.dart';
import 'package:mir_expense_tracker/screens/auth/controller/auth_controller.dart';
import 'package:mir_expense_tracker/screens/crm/clients/controller/clients_controller.dart';
import 'package:mir_expense_tracker/screens/dashboard/view/components/header.dart';
import 'package:mir_expense_tracker/screens/A_main/components/side_menu.dart';
import 'package:mir_expense_tracker/screens/A_main/controller/home_main_controller.dart';
import 'package:mir_expense_tracker/controllers/MenuAppController.dart';
import 'package:mir_expense_tracker/responsive.dart';
import 'package:mir_expense_tracker/screens/dashboard/view/dashboard_screen.dart';
import 'package:intl/intl.dart';
import 'package:mir_expense_tracker/screens/project/controller/project_controller.dart';
import 'package:provider/provider.dart';
import 'package:expandable/expandable.dart';


class AddClient extends GetView<ClientController> {
  const AddClient({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.appColor,
        title: Text("Add Clients"),
        centerTitle: true,
      ),
        body: SingleChildScrollView(
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
                      "Add Client Name",
                    ),
                    CustomTextInput(
                      textController: controller.clientNameController.value,
                      hintText: "Expense Title",
                      keybrdType: true,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text("Organisation"),
                    CustomTextInput(
                      textController: controller.clientOrganisationNameController.value,
                      hintText: "Organisation",
                      keybrdType: true,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text("Address"),
                    CustomTextInput(
                      textController: controller.clientOrganisationNameController.value,
                      hintText: "Address",
                      keybrdType: true,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text("Email"),
                    CustomTextInput(
                      textController: controller.clientOrganisationNameController.value,
                      hintText: "Email",
                      keybrdType: true,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text("Mobile"),
                    CustomTextInput(
                      textController: controller.clientOrganisationNameController.value,
                      hintText: "Primary Mobile NUmber",
                      keybrdType: true,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text("HotLine"),
                    CustomTextInput(
                      textController: controller.clientOrganisationNameController.value,
                      hintText: "Hotline Number",
                      keybrdType: true,
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    GestureDetector(
                      onTap: () {
                        controller.addClientController().then((e){
                             Get.toNamed(Routes.CLIENTLIST);
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
                              'Add Project',
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
        ));

  }
}
