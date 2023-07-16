import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:mir_expense_tracker/Widget/custom_text_field.dart';
import 'package:mir_expense_tracker/routes/app_pages.dart';
import 'package:mir_expense_tracker/screens/contact_list/controller/contact_controller.dart';
import 'package:mir_expense_tracker/screens/team/controller/team_controller.dart';

class TeamAddForm extends GetView<TeamController> {
  const TeamAddForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          title: Text("Add New TeamMate"),
        ),
        body: SingleChildScrollView(
          child: Container(
            width: size.width,
            height: size.height * 1.5,
            child: SafeArea(
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 40, vertical: 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Add New Team member",
                    ),
                    CustomTextInput(
                      textController: controller.nameController.value,
                      hintText: "Member Name",
                      keybrdType: true,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text("Address"),
                    CustomTextInput(
                      textController: controller.addressController.value,
                      hintText: "Address",
                      keybrdType: true,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text("Mobile"),
                    CustomTextInput(

                      textController: controller.mobileController.value,
                      hintText: "Mobile",
                      keybrdType: false,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text("Project"),
                    CustomTextInput(
                      textController: controller.projectController.value,
                      hintText: "Project",
                      keybrdType: true,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text("Role"),
                    CustomTextInput(
                      textController: controller.roleController.value,
                      hintText: "Role in company",
                      keybrdType: true,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text("Password"),
                    CustomTextInput(
                      textController: controller.passController.value,
                      hintText: "Password",
                      keybrdType: true,
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    GestureDetector(
                      onTap: () {
                        controller.addTeamController().then((e){
                          controller.retrieveTeam().then((value) {
                            controller.teamList.value = value;
                             Get.toNamed(Routes.TEAMLIST);
                          });
                        });

                      },
                      child: Container(
                        height: 60,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                            color: Colors.green,
                            borderRadius: BorderRadius.circular(6),
                            border: Border.all(
                                color: Colors.grey.withOpacity(.35))),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Center(
                            child: Text(
                              'Add Team Member',
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
