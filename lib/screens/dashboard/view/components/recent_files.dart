import 'package:mir_expense_tracker/Utils/my_colors.dart';
import 'package:mir_expense_tracker/constants.dart';
import 'package:mir_expense_tracker/models/RecentFile.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mir_expense_tracker/models/transaction_model/trans_category_model.dart';



class RecentFiles extends StatefulWidget {
  const RecentFiles({
    Key? key,
  }) : super(key: key);

  @override
  State<RecentFiles> createState() => _RecentFilesState();
}

class _RecentFilesState extends State<RecentFiles> {

  List<TransactionCategoryModel> listTest = [
    TransactionCategoryModel(catDes: "dd", catName: "aa", type: "rr",),
    TransactionCategoryModel(catDes: "22", catName: "23", type: "24",),
    TransactionCategoryModel(catDes: "32", catName: "33", type: "34",),
  ];
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
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
                fontWeight: FontWeight.bold
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height *.7,
              width: MediaQuery.of(context).size.width,
              child: DataTable2(
                columnSpacing: defaultPadding,

                minWidth: 600,
                columns: [
                  DataColumn(
                    label: Text("Client Name",style: TextStyle(
                        color: MyColors.customYellow
                    ),),
                  ),
                  DataColumn(
                    label: Text("Contact", style: TextStyle(
                        color: MyColors.customYellow
                    ),),
                  ),
                  DataColumn(
                    label: Text("Address", style: TextStyle(
                        color: MyColors.customYellow
                    ),),
                  ),
                  DataColumn(
                    label: Text("Status", style: TextStyle(
                        color: MyColors.customYellow
                    ),),
                  ),
                ],
                rows: List.generate(
                  listTest.length,
                  (index) => DataRow(
                    cells: [
                      DataCell(Text(listTest[index].catName!)),
                      DataCell(Text(listTest[index].catName!)),
                      DataCell(Text(listTest[index].catName!)),
                      DataCell(Text(listTest[index].catName!)),


                    ]
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

DataRow recentFileDataRow(RecentFile fileInfo) {
  return DataRow(
    cells: [

      DataCell(Text(fileInfo.title!)),
      DataCell(Text(fileInfo.contact!)),
      DataCell(Text(fileInfo.address!)),
      DataCell(Text(fileInfo.status!,style: TextStyle(color: Colors.green),)),
    ],
  );
}
