import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mir_expense_tracker/Utils/app_colors/app_color.dart';
import 'package:mir_expense_tracker/Utils/my_colors.dart';
import 'package:mir_expense_tracker/constants.dart';
import 'package:mir_expense_tracker/models/team_list_model.dart';
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
import 'package:mir_expense_tracker/screens/team/controller/team_controller.dart';
import 'package:provider/provider.dart';

class TeamList extends GetView<TeamController> {
  const TeamList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

      return Scaffold(
          key: context.read<MenuAppController>().scaffoldKeyTm,
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              Get.toNamed(Routes.ADDTEAM);
            },
            child: Center(
              child: Icon(Icons.add),
            ),
          ),
          drawer: SideMenu(),
          body: Obx(
              ()  {
              return SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    SizedBox(
                      height: 10,
                    ),
                    Header(
                      headerTitle: "TeamList",
                    ),
                    SizedBox(height: defaultPadding),
                    Center(
                      child: Text("Team List"),
                    ),

                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SizedBox(
                        height: size.height * .5,
                        width: size.width,
                        child: ListView.builder(
                            itemCount: controller.teamList.length,
                            itemBuilder: (BuildContext con, index) {
                              var data = controller.teamList[index];
                              return Card(
                                color: AppColor.listTile.withOpacity(.3),
                                child: Row(
                                  children: <Widget>[

                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Text(
                                          data.name!,
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w500,
                                            fontSize: 16,
                                          ),
                                        ),
                                        Text(
                                          "Project: ${data.project!}",
                                          style: TextStyle(
                                            color: Colors.cyanAccent,
                                            fontWeight: FontWeight.normal,
                                            fontSize: 10,
                                          ),
                                        ),
                                        Text(
                                          data.role!,
                                          style: TextStyle(
                                            color: AppColor.customYellow,
                                            fontWeight: FontWeight.w600,
                                            fontSize: 10,
                                          ),
                                        ),
                                        Text(
                                          data.role!,
                                          style: TextStyle(
                                            color: AppColor.customYellow,
                                            fontWeight: FontWeight.w600,
                                            fontSize: 10,
                                          ),
                                        ),
                                        Container(
                                          width:
                                          MediaQuery.of(context).size.width * .44,
                                          child:  data.active == true ? Text(
                                            maxLines: 1,
                                            "Active",
                                            style: TextStyle(
                                              color: Colors.green,
                                              fontWeight: FontWeight.normal,
                                              fontSize: 10,
                                            ),
                                          ) : Text(
                                            maxLines: 1,
                                            "Inactive",
                                            style: TextStyle(
                                              color: Colors.red,
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
                                            controller.launchPhoneDialer(data.mobile!);
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
                                            controller.launchWhatsapp(data.mobile!.toString());
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
                                        InkWell(
                                          onTap: (){
                                            showDialog(
                                                context: context,
                                                builder: (BuildContext context) {
                                                  return AlertDialog(
                                                    elevation: 10,
                                                    backgroundColor: Colors.transparent,
                                                    content: Card(
                                                      child: Container(
                                                        color: MyColors.purpleLight,
                                                        height: 200,
                                                        width: 300,
                                                        child: ListView(
                                                          children: [
                                                            DrawerListTile(
                                                              title: "Remove this user",
                                                              svgSrc: "assets/icons/menu_notification.svg",
                                                              press: () {
                                                                controller.deleteTeamMember(data.id!).then((value) {
                                                                  controller.retrieveTeam().then((value) {
                                                                    controller.teamList.value = value;
                                                                    //Get.toNamed(Routes.TEAMLIST);
                                                                  });
                                                                });
                                                              },
                                                            ),
                                                            DrawerListTile(
                                                              title: "Active",
                                                              svgSrc: "assets/icons/menu_profile.svg",
                                                              press: () {
                                                                controller.updateTransaction(
                                                                    TeamModel(
                                                                      id: data.id,
                                                                      name: data.name,
                                                                      address: data.address,
                                                                      active: data.active == true ? false : true,
                                                                      designation: data.designation,
                                                                      role: data.role,
                                                                      project: data.project

                                                                    )
                                                                ).then((e){
                                                                  controller.retrieveTeam().then((value) {
                                                                    controller.teamList.value = value;
                                                                    //Get.toNamed(Routes.TEAMLIST);
                                                                  });
                                                                });
                                                                // Navigator.pushAndRemoveUntil<dynamic>(
                                                                //   context,
                                                                //   MaterialPageRoute<dynamic>(
                                                                //     builder: (BuildContext context) => ScheduleHomePage(),
                                                                //   ),
                                                                //       (route) =>
                                                                //   false, //if you want to disable back feature set to false
                                                                // );


                                                              },
                                                            ),
                                                            DrawerListTile(
                                                              title: "Inactive",
                                                              svgSrc: "assets/icons/menu_setting.svg",
                                                              press: () {},
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  );
                                                });
                                          },
                                          child: Card(
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
              );
            }
          )
      );

  }
}
