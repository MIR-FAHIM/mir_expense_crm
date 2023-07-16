import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mir_expense_tracker/Utils/app_colors/app_color.dart';
import 'package:mir_expense_tracker/Utils/my_colors.dart';
import 'package:mir_expense_tracker/constants.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:mir_expense_tracker/screens/attendance/controller/attedance_controller.dart';
import 'package:mir_expense_tracker/screens/attendance/demo_attendance_model.dart';
import 'package:mir_expense_tracker/screens/attendance/view/attendance_list_view.dart';
import 'package:mir_expense_tracker/screens/auth/controller/auth_controller.dart';
import 'package:mir_expense_tracker/screens/dashboard/view/components/header.dart';
import 'package:mir_expense_tracker/screens/A_main/components/side_menu.dart';
import 'package:mir_expense_tracker/screens/A_main/controller/home_main_controller.dart';
import 'package:mir_expense_tracker/controllers/MenuAppController.dart';
import 'package:mir_expense_tracker/responsive.dart';
import 'package:mir_expense_tracker/screens/dashboard/view/dashboard_screen.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mir_expense_tracker/screens/project/controller/project_controller.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';
import '../../../routes/app_pages.dart';

class AttendanceMainPage extends GetView<AttendanceController> {
  const AttendanceMainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Obx(() {
      return Scaffold(
          key: context.read<MenuAppController>().scaffoldKeyAtten,
          drawer: SideMenu(),
          body: SingleChildScrollView(
            child: SafeArea(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // We want this side menu only for large screen
                  if (Responsive.isDesktop(context))
                    Expanded(
                      // default flex = 1
                      // and it takes 1/6 part of the screen
                      child: SideMenu(),
                    ),
                  Expanded(
                    // It takes 5/6 part of the screen
                    flex: 5,
                    child: Column(
                      children: [
                        Header(
                          headerTitle: "Attendance",
                        ),
                        SizedBox(height: defaultPadding),
                        DefaultTabController(
                          initialIndex: controller.monthSelection.value - 1,
                          length: 12,
                          child: Container(
                            height: 30,
                            child: Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 8),
                                  child: Container(
                                    width: 70,
                                    child: DropdownButton<String>(
                                      value: "2023",
                                      isExpanded: true,
                                      icon: Icon(Icons.arrow_drop_down_outlined),
                                      elevation: 16,
                                      style:
                                          const TextStyle(color: Colors.orange),
                                      underline: Container(
                                        height: 2,
                                        color: Colors.transparent,
                                      ),
                                      onChanged: (String? value) {
                                        // This is called when the user selects an item.

                                        controller.dropDownValue11.value = value!;
                                        controller.yearSelection.value =
                                            int.parse(
                                                controller.dropDownValue11.value);
                                      },
                                      items: controller.yearList
                                          .map<DropdownMenuItem<String>>((value) {
                                        return DropdownMenuItem<String>(
                                          value: value,
                                          child: Text(value),
                                        );
                                      }).toList(),
                                    ),
                                  ),
                                ),
                                Container(
                                  width: MediaQuery.of(context).size.width * .7,
                                  child: DefaultTabController(
                                    initialIndex:
                                        controller.monthSelection.value - 1,
                                    length: 12,
                                    child: TabBar(
                                      indicator: BoxDecoration(
                                          borderRadius: BorderRadius.circular(10),
                                          color: MyColors.pinkHex),
                                      isScrollable: true,
                                      indicatorColor: Colors.black,
                                      labelColor: MyColors.customYellow,
                                      onTap: (index) {
                                        controller.monthSelection.value =
                                            index + 1;
                                      },
                                      tabs: controller.dayTab
                                          .map((tab) => Tab(
                                                icon: Padding(
                                                  padding:
                                                      const EdgeInsets.all(4.0),
                                                  child: Text(
                                                    tab.toString(),
                                                    style:
                                                        TextStyle(fontSize: 12),
                                                  ),
                                                ),
                                              ))
                                          .toList(),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 2.0),
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Container(
                              width: MediaQuery.of(context).size.width * .8,
                              height: 70,
                              child: DefaultTabController(
                                initialIndex: controller.daySelection.value - 1,
                                length: 31,
                                child: Column(
                                  children: [
                                    TabBar(
                                      isScrollable: true,
                                      indicatorColor: MyColors.pinkHex,
                                      labelColor: MyColors.greenPaste,
                                      onTap: (index) {
                                        controller.daySelection.value = index + 1;
                                      },
                                      tabs: controller.dayTab
                                          .map((tab) => Tab(
                                                icon: Padding(
                                                  padding:
                                                      const EdgeInsets.all(2.0),
                                                  child: Text(
                                                    tab.toString(),
                                                    style: TextStyle(
                                                      fontSize: 12,
                                                    ),
                                                  ),
                                                ),
                                              ))
                                          .toList(),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width,
                          height:
                               MediaQuery.of(context).size.height * .5,

                          child: AttendanceListView(),
                        ),

                        SizedBox(height: 50),


                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              height: 100,
                              width: 100,

                              decoration: BoxDecoration(
                                color: Colors.green,

                                shape: BoxShape.circle
                              ),
                              child: GestureDetector(
                                  onTap: (){
                                    Get.toNamed(Routes.GIVEATTENDANCE);
                                  },
                                  child: Center(child: Text("Active", style: TextStyle(color: Colors.white),))),
                            ),
                            SizedBox(
                              height: 150,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    // crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      GestureDetector(
                                        onTap: () {
                                          controller.getTime();
                                        },
                                        child: Text(
                                          DateFormat('hh:mm').format(DateTime.now()),
                                          style: const TextStyle(
                                              fontSize: 20, fontWeight: FontWeight.w300),
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 5,
                                      ),
                                      Text(
                                        DateFormat('a').format(DateTime.now()),
                                        style: const TextStyle(
                                            fontSize: 16, fontWeight: FontWeight.w400),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        DateFormat.EEEE().format(DateTime.now()),
                                        style: const TextStyle(
                                            fontSize: 12, fontWeight: FontWeight.w600),
                                      ),
                                      const SizedBox(
                                        width: 5,
                                      ),
                                      Text(
                                        DateFormat.yMd().format(DateTime.now()),
                                        style: const TextStyle(
                                            fontSize: 12, fontWeight: FontWeight.w600),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              height: 100,
                              width: 100,
                              decoration: BoxDecoration(
                                  color: Colors.red,
                                  shape: BoxShape.circle
                              ),
                              child: GestureDetector(
                                  onTap: (){
                                    Get.toNamed(Routes.GIVEATTENDANCE);
                                  },
                                  child: Center(child: Text("Inactive", style: TextStyle(color: Colors.white),))),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ));
    });
  }
}
