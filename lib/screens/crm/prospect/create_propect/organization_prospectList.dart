import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mir_expense_tracker/Utils/app_colors/app_color.dart';
import 'package:mir_expense_tracker/Utils/my_colors.dart';
import 'package:mir_expense_tracker/Widget/custom_text_field.dart';
import 'package:mir_expense_tracker/constants.dart';
import 'package:mir_expense_tracker/routes/app_pages.dart';
import 'package:mir_expense_tracker/screens/auth/controller/auth_controller.dart';
import 'package:mir_expense_tracker/screens/crm/prospect/controller/prospect_controller.dart';
import 'package:mir_expense_tracker/screens/dashboard/view/components/header.dart';
import 'package:mir_expense_tracker/screens/A_main/components/side_menu.dart';
import 'package:mir_expense_tracker/screens/A_main/controller/home_main_controller.dart';
import 'package:mir_expense_tracker/controllers/MenuAppController.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:provider/provider.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:intl/intl.dart';

class OrganizationListView extends GetView<ProspectController> {
  const OrganizationListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Obx(() {
      return Scaffold(
        key: context.read<MenuAppController>().scaffoldKeyOrganizationProspect,
        drawer: SideMenu(),

        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(defaultPadding),
            decoration: BoxDecoration(
              color: MyColors.purpleLight,
              borderRadius: const BorderRadius.all(Radius.circular(10)),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Opportunities",
                  style: TextStyle(
                      color: Colors.blue,
                      fontSize: 14,
                      fontWeight: FontWeight.bold),
                ),
                Container(
                  height: MediaQuery.of(context).size.height * .7,
                  width: MediaQuery.of(context).size.width,
                  child: DataTable2(
                    columnSpacing: defaultPadding,
                    minWidth: 600,
                    columns: [
                      DataColumn(
                        label: Text(
                          "Client Name",
                          style: TextStyle(color: MyColors.customYellow),
                        ),
                      ),
                      DataColumn(
                        label: Text(
                          "Contact",
                          style: TextStyle(color: MyColors.customYellow),
                        ),
                      ),
                      DataColumn(
                        label: Text(
                          "Address",
                          style: TextStyle(color: MyColors.customYellow),
                        ),
                      ),
                      DataColumn(
                        label: Text(
                          "Status",
                          style: TextStyle(color: MyColors.customYellow),
                        ),
                      ),
                    ],
                    rows: List.generate(
                      controller.prospectList.length,
                      (index) => DataRow(cells: [
                        DataCell(Text(controller.prospectList[index].prospectName!)),
                        DataCell(Text(controller.prospectList[index].prospectMobile!)),
                        DataCell(Text(controller.prospectList[index].prospectEmail!)),
                        DataCell(Text(controller.prospectList[index].prospectNoteDes!)),
                      ]),
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
