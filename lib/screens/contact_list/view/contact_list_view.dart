import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mir_expense_tracker/Utils/app_colors/app_color.dart';
import 'package:mir_expense_tracker/constants.dart';
import 'package:mir_expense_tracker/routes/app_pages.dart';
import 'package:mir_expense_tracker/screens/auth/controller/auth_controller.dart';
import 'package:mir_expense_tracker/screens/contact_list/controller/contact_controller.dart';
import 'package:mir_expense_tracker/screens/dashboard/view/components/header.dart';
import 'package:mir_expense_tracker/screens/A_main/components/side_menu.dart';
import 'package:mir_expense_tracker/screens/A_main/controller/home_main_controller.dart';
import 'package:mir_expense_tracker/controllers/MenuAppController.dart';
import 'package:mir_expense_tracker/responsive.dart';
import 'package:mir_expense_tracker/screens/dashboard/view/dashboard_screen.dart';
import 'package:flutter/material.dart';
import 'package:mir_expense_tracker/screens/project/controller/project_controller.dart';
import 'package:provider/provider.dart';

class ContactList extends GetView<ContactController> {
  const ContactList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

      return Scaffold(
          key: context.read<MenuAppController>().scaffoldKeyContact,
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
                  headerTitle: "ContactList",
                ),
                SizedBox(height: defaultPadding),
                Center(
                  child: Text("Contact List"),
                ),

                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    height: size.height * .5,
                    width: size.width,
                    child: ListView.builder(
                        itemCount: 5,
                        itemBuilder: (BuildContext con, index) {
                          //var data = controller.projectList[index];
                          return Card(
                            color: AppColor.listTile.withOpacity(.3),
                            child: Row(
                              children: <Widget>[

                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      "Mir Fahim Rahman",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 16,
                                      ),
                                    ),
                                    Text(
                                      "project1, Project 2, OneTap",
                                      style: TextStyle(
                                        color: Colors.cyanAccent,
                                        fontWeight: FontWeight.normal,
                                        fontSize: 10,
                                      ),
                                    ),
                                    Text(
                                      "Senior Software Engineer",
                                      style: TextStyle(
                                        color: AppColor.customYellow,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 10,
                                      ),
                                    ),
                                    Container(
                                      width:
                                      MediaQuery.of(context).size.width * .44,
                                      child: Text(
                                        maxLines: 3,
                                        "Active",
                                        style: TextStyle(
                                          color: Colors.green,
                                          fontWeight: FontWeight.normal,
                                          fontSize: 10,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Spacer(),
                                Row(
                                  children: [


                                    InkWell(
                                      splashColor:
                                      Colors
                                          .blue,
                                      onTap:
                                          () {
                                        controller.launchPhoneDialer(
                                            "2424");
                                      },
                                      child:
                                      Card(
                                        color: AppColor.listTile.withOpacity(.3),
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                            BorderRadius.circular(100)),
                                        child:
                                        Container(
                                          decoration:
                                          BoxDecoration(shape: BoxShape.circle),
                                          child:
                                          Padding(
                                            padding:
                                            const EdgeInsets.all(8.0),
                                            child:
                                            Icon(
                                              Icons.call,
                                              color: primaryColor,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    InkWell(
                                      splashColor:
                                      Colors
                                          .blue,
                                      onTap:
                                          () {
                                        controller.launchWhatsapp(
                                            356.toString());
                                      },
                                      child:
                                      Card(
                                        color: AppColor.listTile.withOpacity(.3),
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                            BorderRadius.circular(100)),
                                        child:
                                        Container(
                                          decoration:
                                          BoxDecoration(shape: BoxShape.circle),
                                          child:
                                          Padding(
                                            padding:
                                            const EdgeInsets.all(8.0),
                                            child:
                                            Icon(
                                              Icons.messenger,
                                              color: primaryColor,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Card(
                                      color: AppColor.listTile.withOpacity(.3),
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                          BorderRadius.circular(100)),
                                      child:
                                      Container(
                                        decoration:
                                        BoxDecoration(shape: BoxShape.circle),
                                        child:
                                        Padding(
                                          padding:
                                          const EdgeInsets.all(8.0),
                                          child:
                                          Icon(
                                            Icons.more_horiz,
                                            color:
                                            primaryColor,
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          );
                        }),
                  ),
                )
              ],
            ),
          )
      );

  }
}
