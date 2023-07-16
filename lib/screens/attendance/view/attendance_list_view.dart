import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mir_expense_tracker/Utils/app_colors/app_color.dart';
import 'package:mir_expense_tracker/Utils/my_colors.dart';
import 'package:mir_expense_tracker/constants.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:mir_expense_tracker/screens/attendance/controller/attedance_controller.dart';
import 'package:mir_expense_tracker/screens/attendance/demo_attendance_model.dart';
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

class AttendanceListView extends GetView<AttendanceController> {
  const AttendanceListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Obx(() {
      return  Scrollbar(
        controller: controller.scrollController.value,
        child: SingleChildScrollView(
          controller:controller.scrollController.value,

          child: Container(
            width: Responsive.isMobile(context) ? MediaQuery.of(context).size.width : MediaQuery.of(context).size.width * .5,
            height:  Responsive.isMobile(context) ? MediaQuery.of(context).size.height : MediaQuery.of(context).size.height * .5,
            padding: EdgeInsets.all(defaultPadding),
            decoration: BoxDecoration(
              color: secondaryColor,
              borderRadius: const BorderRadius.all(Radius.circular(10)),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Active Teammates",
                  style: TextStyle(
                      color: Colors.blue,
                      fontSize: 14,
                      fontWeight: FontWeight.bold
                  ),
                ),
                Responsive.isMobile(context) ?
                Container(
                  height: MediaQuery.of(context).size.height *.7,
                  width: MediaQuery.of(context).size.width,
                  child: DataTable2(
                    columnSpacing: 2,

                    minWidth: MediaQuery.of(context).size.width,
                    columns: [
                      DataColumn(
                        label: Text("Teammate", style: TextStyle(
                          color: MyColors.customYellow,
                          fontSize: 10,
                        ),),
                      ),
                      DataColumn(
                        label: Text("Checkin", style: TextStyle(
                          color: MyColors.customYellow,
                          fontSize: 10,
                        ),),
                      ),
                      DataColumn(
                        label: Text("Checkout", style: TextStyle(
                          color: MyColors.customYellow,
                          fontSize: 10,
                        ),),
                      ),
                      DataColumn(
                        label: Text("Working", style: TextStyle(
                          color: MyColors.customYellow,
                          fontSize: 10,
                        ),),
                      ),
                      DataColumn(
                        label: Text("Active", style: TextStyle(
                          color: MyColors.customYellow,
                          fontSize: 10,
                        ),),
                      ),
                    ],
                    rows: List.generate(
                      demoAttendanceListModels.length,
                          (index) => recentFileDataRowMobile(demoAttendanceListModels[index]),
                    ),
                  ),
                )
                    :
                Container(
                  height: MediaQuery.of(context).size.height *.7,
                  width: MediaQuery.of(context).size.width,
                  child: DataTable2(
                    columnSpacing: 2,

                    minWidth: MediaQuery.of(context).size.width *.8,
                    columns: [
                      DataColumn(
                        label: Text("Teammate Name", style: TextStyle(
                            color: MyColors.customYellow
                        ),),
                      ),
                      DataColumn(
                        label: Text("Checkin", style: TextStyle(
                            color: MyColors.customYellow
                        ),),
                      ),
                      DataColumn(
                        label: Text("Checkout", style: TextStyle(
                            color: MyColors.customYellow
                        ),),
                      ),
                      DataColumn(
                        label: Text("Working Hour", style: TextStyle(
                            color: MyColors.customYellow
                        ),),
                      ),
                      DataColumn(
                        label: Text("Active", style: TextStyle(
                            color: MyColors.customYellow
                        ),),
                      ),
                    ],
                    rows: List.generate(
                      demoAttendanceListModels.length,
                          (index) => recentFileDataRow(demoAttendanceListModels[index]),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    });
  }

}

DataRow recentFileDataRow(AttendanceListModel fileInfo) {
  return DataRow(
    cells: [
      DataCell(
        Row(
          children: [
            SvgPicture.asset(
              fileInfo.icon!,
              height: 30,
              width: 30,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
              child: Text(fileInfo.title!,style: TextStyle(fontSize: 12),),
            ),
          ],
        ),
      ),
      DataCell(Text(fileInfo.date!)),
      DataCell(Text(fileInfo.date!)),
      DataCell(Text(fileInfo.size!)),
      DataCell(Text(fileInfo.label!, style: TextStyle(color: fileInfo.label == "No" ? Colors.redAccent : MyColors.greenLight),)),

    ],
  );
}
DataRow recentFileDataRowMobile(AttendanceListModel fileInfo) {
  return DataRow(
    cells: [
      DataCell(
        Row(
          children: [
            SvgPicture.asset(
              fileInfo.icon!,
              height: 20,
              width: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(4),

              child: Container(
                height: 20,
                width: 40,
                child: Text(fileInfo.title!,style: TextStyle(fontSize: 10),
                  maxLines: 2,
                ),
              ),
            ),
          ],
        ),
      ),
      DataCell(Text(fileInfo.date!, style: TextStyle(fontSize: 10),)),
      DataCell(Text(fileInfo.date!, style: TextStyle(fontSize: 10),)),
      DataCell(Text(fileInfo.size!, style: TextStyle(fontSize: 10),)),
      DataCell(Text(fileInfo.label!, style: TextStyle(color: fileInfo.label == "No" ? Colors.redAccent : MyColors.greenLight, fontSize: 10),)),

    ],
  );
}