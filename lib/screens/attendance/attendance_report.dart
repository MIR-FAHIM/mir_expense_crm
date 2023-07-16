import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:intl/intl.dart';
import 'package:mir_expense_tracker/Utils/my_colors.dart';

///import 'package:my_app/globals.dart' as globals;

class Report extends StatefulWidget {
  @override
  State<Report> createState() => _ReportState();
}

class _ReportState extends State<Report> {
  final summaryOpen = false.obs;

  //TabController _tabController;
  List listData = [];
  int workingDays = 0;
  int onTime = 0;
  int late = 0;
  int leftEarly = 0;
  List<String> yearList = <String>[
    DateTime.now().year.toString(),
    DateTime(DateTime.now().year - 1).toString().substring(0, 4),
    DateTime(DateTime.now().year - 2).toString().substring(0, 4)
  ];
  String dropdownValue = DateTime.now().year.toString();
  int onLeave = 0;
  int absent = 0;
  int yearSelection = int.parse(DateTime.now().toString().substring(0, 4));
  int monthSelection = int.parse(DateTime.now().toString().substring(5, 7));
  Future  method() async {
    List a = [
      "q",
      "x"
    ];
    return a;
  }
  List<DataCell> dataRow = [
    DataCell(
      Container(
          height: 50,
          decoration: BoxDecoration(
              color: Colors.grey, borderRadius: BorderRadius.circular(6)),
          width: 30,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 4.0),
            child: Column(
              children: [
                Text(
                  '13',
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 3,
                ),
                Text(
                  'SAT',
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          )),
    ),
    DataCell(
      Container(
          width: 80,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '08:26am',
                style:
                TextStyle(color: Colors.grey, fontWeight: FontWeight.w600),
              ),
              Text(
                'Central building office',
                style: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.w600,
                    fontSize: 8),
              )
            ],
          )),
    ),
    DataCell(
      Container(
          width: 80,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '08:26am',
                style:
                TextStyle(color: Colors.grey, fontWeight: FontWeight.w600),
              ),
              Text(
                'Central building office',
                style: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.w600,
                    fontSize: 8),
              )
            ],
          )),
    ),
    DataCell(
      Container(
        width: 80,
        child: Text(
          '10hr00mm',
          style: TextStyle(color: Colors.grey, fontWeight: FontWeight.w600),
        ),
      ),
    ),
  ];

  List<String> tabs = [
    'January',
    'February',
    'March',
    'April',
    'May',
    'June',
    'July',
    'August',
    'September',
    'October',
    'November',
    'December'
  ];

  //AttendanceRepository attendanceRepository = AttendanceRepository();
  @override
  void initState() {


    // TODO: implement initState
    super.initState();
  }

  leaveCount(List data) {
    num count = 0;
    data.forEach((item) => count += item.onLeave);
    print("on leave is $count");
    onLeave = count.toInt();
    return count;
  }

  leftTimelyCount(List data) {
    num count = 0;
    data.forEach((item) => count += item.onLeave);
    print("on leave is $count");
    onLeave = count.toInt();
    return count;
  }

  onTimeCount(List data) {
    num count = 0;
    data.forEach((item) => count += item.onLeave);
    print("on leave is $count");
    onTime = count.toInt();
    return count;
  }

  workingDaysCount(List data) {
    num count = 0;
    data.forEach((item) => count += item.onLeave);
    print("on leave is $count");
    workingDays = count.toInt();
    return count;
  }

  absentCount(List data) {
    num count = 0;
    data.forEach((item) => count += item.onLeave);
    print("on leave is $count");
    absent = count.toInt();
    return count;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width*.3,

      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6),
                  color: MyColors.customYellow),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Summary',
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),

                  ],
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
         FutureBuilder(
              future: method(),
              builder: (
                  BuildContext context,
                  AsyncSnapshot snapshot,
                  ) {
                // print("my report data is ++++++++++++${snapshot.data!.result![0].workingDays}");

                if (snapshot.hasData) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: AnimatedContainer(
                      curve: Curves.easeIn,
                      duration: const Duration(seconds: 1),
                      child: Column(
                        children: [
                          summaryRow(
                              Colors.blue, 'Working Days', workingDays),
                          Divider(
                            thickness: 2,
                            color: Colors.grey.withOpacity(.35),
                          ),
                          summaryRow(Colors.green, 'On Time', onTime),
                          Divider(
                            thickness: 2,
                            color: Colors.grey.withOpacity(.35),
                          ),
                          summaryRow(Colors.red, 'Late', late),
                          Divider(
                            thickness: 2,
                            color: Colors.grey.withOpacity(.35),
                          ),
                          summaryRow(
                              Colors.greenAccent, 'Left Timely', leftEarly),
                          Divider(
                            thickness: 2,
                            color: Colors.grey.withOpacity(.35),
                          ),
                          summaryRow(
                              Colors.redAccent, 'Left Early', leftEarly),
                          Divider(
                            thickness: 2,
                            color: Colors.grey.withOpacity(.35),
                          ),
                          summaryRow(Colors.orange, 'On leave', onLeave),
                          Divider(
                            thickness: 2,
                            color: Colors.grey.withOpacity(.35),
                          ),
                          summaryRow(Colors.red.withOpacity(.35), 'Absent',
                              absent),
                          Divider(
                            thickness: 2,
                            color: Colors.grey.withOpacity(.35),
                          ),
                        ],
                      ),
                    ),
                  );
                } else if (snapshot.hasError) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: AnimatedContainer(
                      curve: Curves.easeIn,
                      duration: const Duration(seconds: 1),
                      child: Column(
                        children: [
                          summaryRow(Colors.blue, 'Working Days', 0),
                          Divider(
                            thickness: 2,
                            color: Colors.grey.withOpacity(.35),
                          ),
                          summaryRow(Colors.green, 'On Time', 0),
                          Divider(
                            thickness: 2,
                            color: Colors.grey.withOpacity(.35),
                          ),
                          summaryRow(Colors.red, 'Late', 2),
                          Divider(
                            thickness: 2,
                            color: Colors.grey.withOpacity(.35),
                          ),
                          summaryRow(Colors.greenAccent, 'Left Timely', 10),
                          Divider(
                            thickness: 2,
                            color: Colors.grey.withOpacity(.35),
                          ),
                          summaryRow(Colors.redAccent, 'Left Early', 25),
                          Divider(
                            thickness: 2,
                            color: Colors.grey.withOpacity(.35),
                          ),
                          summaryRow(Colors.orange, 'On leave', 4),
                          Divider(
                            thickness: 2,
                            color: Colors.grey.withOpacity(.35),
                          ),
                          summaryRow(
                              Colors.red.withOpacity(.35), 'Absent', 8),
                          Divider(
                            thickness: 2,
                            color: Colors.grey.withOpacity(.35),
                          ),
                        ],
                      ),
                    ),
                  );
                }
                return CircularProgressIndicator();
              })


        ],
      ),
    );
  }

  Widget summaryRow(color, name, days) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Container(
              height: 10,
              width: 10,
              decoration: BoxDecoration(color: color),
            ),
            const SizedBox(
              width: 10,
            ),
            Text(
              '$name',
              style: const TextStyle(fontWeight: FontWeight.w600),
            )
          ],
        ),
        Text(
          '$days Days',
          style: const TextStyle(color: Colors.grey),
        )
      ],
    );
  }
}
// table view attendance

// Expanded(
// child: TabBarView(
// physics: AlwaysScrollableScrollPhysics(),
// // physics: NeverScrollableScrollPhysics(),
// children: tabs
//     .map((e) => SingleChildScrollView(
// scrollDirection: Axis.vertical,
// child: SingleChildScrollView(
// scrollDirection: Axis.horizontal,
// child: DataTable(
// dataRowHeight: 60,
// columns: const [
// DataColumn(
// label: SizedBox(
// width: 50,
// child: Text(
// 'Date',
// textAlign: TextAlign.center,
// style: TextStyle(fontSize: 12),
// ),
// ),
// ),
// DataColumn(
// label: SizedBox(
// width: 80,
// child: Text(
// 'Check In',
// textAlign: TextAlign.center,
// style: TextStyle(fontSize: 12),
// ),
// )),
// DataColumn(
// label: SizedBox(
// width: 80,
// child: Text(
// 'Check Out',
// textAlign: TextAlign.center,
// style: TextStyle(fontSize: 12),
// ),
// )),
// DataColumn(
// label: SizedBox(
// width: 80,
// child: Text(
// 'Working Hour',
// textAlign: TextAlign.center,
// style: TextStyle(fontSize: 12),
// ),
// ))
// ],
// rows: [
// DataRow(cells: dataRow.map((e) => e).toList()),
// DataRow(cells: dataRow.map((e) => e).toList()),
// DataRow(cells: dataRow.map((e) => e).toList()),
// DataRow(cells: dataRow.map((e) => e).toList()),
// DataRow(cells: dataRow.map((e) => e).toList()),
// DataRow(cells: dataRow.map((e) => e).toList()),
// DataRow(cells: dataRow.map((e) => e).toList()),
// DataRow(cells: dataRow.map((e) => e).toList()),
// DataRow(cells: dataRow.map((e) => e).toList()),
// DataRow(cells: dataRow.map((e) => e).toList()),
// DataRow(cells: dataRow.map((e) => e).toList()),
// DataRow(cells: dataRow.map((e) => e).toList()),
// ]
//
// ),
// ),
// ),
// )
//     .toList(),
// ),
// ),
