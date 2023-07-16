import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mir_expense_tracker/Utils/app_colors/app_color.dart';
import 'package:mir_expense_tracker/constants.dart';
import 'package:mir_expense_tracker/routes/app_pages.dart';
import 'package:mir_expense_tracker/screens/auth/controller/auth_controller.dart';
import 'package:mir_expense_tracker/screens/dashboard/view/components/header.dart';
import 'package:mir_expense_tracker/screens/A_main/components/side_menu.dart';
import 'package:mir_expense_tracker/screens/A_main/controller/home_main_controller.dart';
import 'package:mir_expense_tracker/controllers/MenuAppController.dart';
import 'package:mir_expense_tracker/responsive.dart';
import 'package:mir_expense_tracker/screens/dashboard/view/dashboard_screen.dart';
import 'package:flutter/material.dart';
import 'package:mir_expense_tracker/screens/project/controller/project_controller.dart';
import 'package:provider/provider.dart';

class ProjectList extends GetView<ProjectController> {
  const ProjectList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Obx(() {
      return Scaffold(
          key: context.read<MenuAppController>().scaffoldKey4,
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              Get.toNamed(Routes.PROJECTADD);
            },
            child: Center(
              child: Icon(Icons.add),
            ),
          ),
          drawer: SideMenu(),
          body: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 10,
                ),
                Header(
                  headerTitle: "ProjectList",
                ),
                SizedBox(height: defaultPadding),
                Center(
                  child: Text("Project List"),
                ),
                SizedBox(
                  height: size.height * .5,
                  width: size.width,
                  child: ListView.builder(
                      itemCount: controller.projectList.length,
                      itemBuilder: (BuildContext con, index) {
                        var data = controller.projectList[index];
                        return Card(
                          child: Row(
                            children: <Widget>[
                              Container(
                                height: 50,
                                width: 50,
                                decoration: BoxDecoration(
                                  color: Colors.lightGreen,
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                child: Icon(
                                  Icons.ac_unit,
                                  color: Colors.white,
                                ),
                              ),
                              SizedBox(width: 10),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    data.projectName!,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 16,
                                    ),
                                  ),

                                  Container(
                                    width:
                                        MediaQuery.of(context).size.width * .44,
                                    child: Text(
                                      maxLines: 3,
                                      data.projectDes!,
                                      style: TextStyle(
                                        color: AppColor.customYellow,
                                        fontWeight: FontWeight.normal,
                                        fontSize: 10,
                                      ),
                                    ),
                                  ),
                                ],
                              ),

                            ],
                          ),
                        );
                      }),
                )
              ],
            ),
          ));
    });
  }
}
