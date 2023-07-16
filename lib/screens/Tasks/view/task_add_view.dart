import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mir_expense_tracker/Utils/app_colors/app_color.dart';
import 'package:mir_expense_tracker/Widget/custom_text_field.dart';
import 'package:mir_expense_tracker/constants.dart';
import 'package:mir_expense_tracker/routes/app_pages.dart';
import 'package:mir_expense_tracker/screens/Tasks/controller/task_controller.dart';
import 'package:mir_expense_tracker/screens/auth/controller/auth_controller.dart';
import 'package:mir_expense_tracker/screens/dashboard/view/components/header.dart';
import 'package:mir_expense_tracker/screens/A_main/components/side_menu.dart';
import 'package:mir_expense_tracker/screens/A_main/controller/home_main_controller.dart';
import 'package:mir_expense_tracker/controllers/MenuAppController.dart';
import 'package:mir_expense_tracker/responsive.dart';
import 'package:mir_expense_tracker/screens/dashboard/view/dashboard_screen.dart';
import 'package:flutter/material.dart';
import 'package:mir_expense_tracker/screens/project/controller/project_controller.dart';
import 'package:mir_expense_tracker/screens/transaction/controller/transaction_controller.dart';
import 'package:provider/provider.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';

class AddTaskView extends GetView<TaskController> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
        key: context.read<MenuAppController>().scaffoldKeyAddTask,
        body: Obx(() {
          return SingleChildScrollView(
            child: Container(
              width: size.width,
              height: size.height * 1.2,
              child: SafeArea(
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 40, vertical: 30),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Add Task Name",
                      ),
                      CustomTextInput(
                        textController: controller.emailController.value,
                        hintText: "Expense Title",
                        keybrdType: true,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        "De",
                        // style: Get.theme.textTheme.bodySmall,
                      ),
                      CustomTextInput(
                        textController: controller.emailController.value,
                        hintText: "Des",
                        keybrdType: false,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text("Description"),
                      CustomTextInput(
                        textController: controller.emailController.value,
                        hintText: "Description",
                        keybrdType: true,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      GestureDetector(
                        onTap: () {
                          controller.addTaskController().then((e){
                            controller.retrieveTask().then((value) {
                              controller.itemsss.value = value;
                              Get.toNamed(Routes.TASKLIST);
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
                                'Add Task',
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
