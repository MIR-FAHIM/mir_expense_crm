import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:mir_expense_tracker/Utils/app_colors/app_color.dart';
import 'package:mir_expense_tracker/Utils/my_colors.dart';
import 'package:mir_expense_tracker/routes/app_pages.dart';
import 'package:mir_expense_tracker/screens/Target/target.dart';
import 'package:mir_expense_tracker/screens/Tasks/dragableTasks/task_main_page.dart';
import 'package:mir_expense_tracker/screens/attendance/attendance_main_page.dart';
import 'package:mir_expense_tracker/screens/crm/prospect/prospect_front_page.dart';
import 'package:get_storage/get_storage.dart';
import 'package:mir_expense_tracker/screens/my_notes/schedule/schedule_home.dart';
import 'package:mir_expense_tracker/screens/project/controller/project_controller.dart';
import 'package:mir_expense_tracker/screens/transaction/controller/transaction_controller.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var storage = GetStorage();
    return Drawer(
      backgroundColor: MyColors.purpleLight,
      child: ListView(
        children: [
          DrawerHeader(
            child: Image.asset("assets/images/logo.png"),
          ),
          DrawerListTile(
            title: "Dashboard",
            svgSrc: "assets/icons/menu_dashbord.svg",
            press: () {
              Get.lazyPut<TransactionController>(
                    () => TransactionController(),

              );
              Get.lazyPut<ProjectController>(
                    () => ProjectController(),

              );
              Get.toNamed(Routes.HOME);
            },
          ),
          DrawerListTile(
            title: "Prospects",
            svgSrc: "assets/icons/menu_tran.svg" ,
            press: () {
              Get.toNamed(Routes.PROSPECTFRONT);
            },
          ),
          DrawerListTile(
            title: "Activity",
            svgSrc: "assets/icons/menu_tran.svg",
            press: () {
              Get.toNamed(Routes.ACTIVITY);
            },
          ),
          DrawerListTile(
            title: "Team",
            svgSrc: "assets/icons/menu_task.svg",
            press: () {
              Get.toNamed(Routes.TEAMLIST);
            },
          ),
          DrawerListTile(
            title: "Clients",
            svgSrc: "assets/icons/menu_doc.svg",
            press: () {
              Get.toNamed(Routes.CLIENTLIST);
            },
          ),
          DrawerListTile(
            title: "Projects",
            svgSrc: "assets/icons/menu_store.svg",
            press: () {
              Get.toNamed(Routes.PROJECTLIST);
            },
          ),
          DrawerListTile(
            title: "Targets",
            svgSrc: "assets/icons/menu_store.svg",
            press: () {
              Navigator.pushAndRemoveUntil<dynamic>(
                context,
                MaterialPageRoute<dynamic>(
                  builder: (BuildContext context) => TargetMainScreen(),
                ),
                (route) =>
                    false, //if you want to disable back feature set to false
              );
            },
          ),
          DrawerListTile(
            title: "Contacts",
            svgSrc: "assets/icons/menu_store.svg",
            press: () {
              Get.toNamed(Routes.CONTACTLIST);
            },
          ),
          DrawerListTile(
            title: "Attendance",
            svgSrc: "assets/icons/menu_store.svg",
            press: () {
              Get.toNamed(Routes.ATTENDANCEMAIN);
            },
          ),
          DrawerListTile(
            title: "Notification",
            svgSrc: "assets/icons/menu_notification.svg",
            press: () {},
          ),
          DrawerListTile(
            title: "My Notes",
            svgSrc: "assets/icons/menu_profile.svg",
            press: () {
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
            title: "Add Category",
            svgSrc: "assets/icons/menu_setting.svg",
            press: () {
              Get.toNamed(Routes.ADDCAT);
            },
          ),
          DrawerListTile(
            title: "LogOut",
            svgSrc: "assets/icons/menu_setting.svg",
            press: () {
              storage.remove("name");
              Get.toNamed(Routes.SPLASHSCREEN);
            },
          ),
        ],
      ),
    );
  }
}

class DrawerListTile extends StatelessWidget {
  const DrawerListTile({
    Key? key,
    // For selecting those three line once press "Command+D"
    required this.title,
    required this.svgSrc,
    required this.press,
  }) : super(key: key);

  final String title, svgSrc;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: press,
      horizontalTitleGap: 0.0,
      leading: SvgPicture.asset(
        svgSrc,
        color: AppColor.customYellow,
        height: 16,
      ),
      title: Text(
        title,
        style: TextStyle(color: Colors.white54),
      ),
    );
  }
}
