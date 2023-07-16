import 'package:drag_and_drop_lists/drag_and_drop_item.dart';
import 'package:drag_and_drop_lists/drag_and_drop_list.dart';
import 'package:drag_and_drop_lists/drag_and_drop_lists.dart';
import 'package:mir_expense_tracker/Utils/my_colors.dart';
import 'package:mir_expense_tracker/constants.dart';
import 'package:mir_expense_tracker/controllers/MenuAppController.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:mir_expense_tracker/controllers/MenuAppController.dart';
import 'package:mir_expense_tracker/responsive.dart';
import 'package:mir_expense_tracker/screens/Tasks/dragableTasks/data_drag.dart';
import 'package:mir_expense_tracker/screens/Tasks/dragableTasks/model_drag.dart';
import 'package:mir_expense_tracker/screens/attendance/attendance_list.dart';
import 'package:mir_expense_tracker/screens/attendance/attendance_report.dart';
import 'package:mir_expense_tracker/screens/dashboard/view/components/header.dart';
import 'package:mir_expense_tracker/screens/dashboard/view/components/recent_files.dart';
import 'package:mir_expense_tracker/screens/A_main/components/side_menu.dart';
import 'package:provider/provider.dart';

class AttendanceMain extends StatefulWidget {
  @override
  _AttendanceMainPage createState() => _AttendanceMainPage();
}

class _AttendanceMainPage extends State<AttendanceMain> {
  late List<DragAndDropList> lists;
  late List<DragAndDropList> weblists;
  List<DraggableList> newList = [];
  List<DraggableListItem> itemsss = [

    DraggableListItem(
      status: 3,
      title: 'Orange',
      urlImage:
      'https://images.unsplash.com/photo-1582979512210-99b6a53386f9?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=934&q=80',
    ),
    DraggableListItem(
      status: 3,
      title: 'Orange',
      urlImage:
      'https://images.unsplash.com/photo-1582979512210-99b6a53386f9?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=934&q=80',
    ),
    DraggableListItem(
      status: 3,
      title: 'Orange',
      urlImage:
      'https://images.unsplash.com/photo-1582979512210-99b6a53386f9?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=934&q=80',
    ),
    DraggableListItem(
      status: 3,
      title: 'Orange',
      urlImage:
      'https://images.unsplash.com/photo-1582979512210-99b6a53386f9?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=934&q=80',
    ),
    DraggableListItem(
      status: 5,
      title: 'Orange',
      urlImage:
      'https://images.unsplash.com/photo-1582979512210-99b6a53386f9?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=934&q=80',
    ),
    DraggableListItem(
      status: 6,
      title: 'Orange',
      urlImage:
      'https://images.unsplash.com/photo-1582979512210-99b6a53386f9?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=934&q=80',
    ),
    DraggableListItem(
      status: 1,
      title: 'Orange',
      urlImage:
      'https://images.unsplash.com/photo-1582979512210-99b6a53386f9?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=934&q=80',
    ),
    DraggableListItem(
      status: 1,
      title: 'Orange',
      urlImage:
      'https://images.unsplash.com/photo-1582979512210-99b6a53386f9?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=934&q=80',
    ),
    DraggableListItem(
      status: 2,
      title: 'Orange',
      urlImage:
      'https://images.unsplash.com/photo-1582979512210-99b6a53386f9?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=934&q=80',
    ),
    DraggableListItem(
      status: 4,
      title: 'Orange',
      urlImage:
      'https://images.unsplash.com/photo-1582979512210-99b6a53386f9?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=934&q=80',
    ),



    DraggableListItem(
      status: 2,
      title: 'Apple',
      urlImage:
      'https://images.unsplash.com/photo-1560806887-1e4cd0b6cbd6?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=3367&q=80',
    ),
    DraggableListItem(
      status: 4,
      title: 'Blueberries',
      urlImage:
      'https://images.unsplash.com/photo-1595231776515-ddffb1f4eb73?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1950&q=80',
    ),

  ];
  List headerList = [
    HeaderModel(
        id: 1,
        header: "New Tasks"
    ),
    HeaderModel(
        id: 2,
        header: "In Progress"
    ),

    HeaderModel(
        id: 3,
        header: "Need Clarifications"
    ),
    HeaderModel(
        id: 4,
        header: "Last Stage"
    ),
    HeaderModel(
        id: 5,
        header: "Completed"
    ),
    HeaderModel(
        id: 6,
        header: "Cancel"
    ),
  ];
  List<DraggableList> result = [];
  makeNewList(){
    headerList.forEach((modelA) {
      var children = itemsss.where((modelB) => modelB.status == modelA.id).toList();
      result.add(DraggableList(
        header: modelA,
        items: children,
      ));
    });

  }

  String dropdownValue = DateTime.now().year.toString();
  List<String> yearList = <String>[DateTime.now().year.toString(), DateTime(DateTime.now().year-1).toString().substring(0,4), DateTime(DateTime.now().year-2).toString().substring(0,4) ];


  int yearSelection = int.parse(DateTime.now().toString().substring(0,4));



  int monthSelection = int.parse(DateTime.now().toString().substring(5, 7));
  int daySelection = int.parse(DateTime.now().toString().substring(8, 10));
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
  List<int> dayTab = [
    1,
    2,
    3,
    4,
    5,
    6,
    7,
    8,
    9,
    10,
    11,
    12,
    13,
    14,
    15,
    16,
    17,
    18,
    19,
    20,
    21,
    22,
    23,
    24,
    25,
    26,
    27,
    28,
    29,
    30,
    31
  ];

  @override
  void initState() {
    super.initState();
    makeNewList();



  }

  @override
  Widget build(BuildContext context) {
    final backgroundColor = Color.fromARGB(255, 243, 242, 248);

    return Scaffold(
        key: context.read<MenuAppController>().scaffoldKeyAtten,
        drawer: SideMenu(),

        body: SafeArea(
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
                    Header(headerTitle: "Attendance",),
                    SizedBox(height: defaultPadding),
                    DefaultTabController(
                      initialIndex: monthSelection - 1,
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
                                  value: dropdownValue,
                                  isExpanded: true,
                                  icon: Icon(Icons
                                      .arrow_drop_down_outlined),
                                  elevation: 16,
                                  style:  TextStyle(
                                      color: MyColors.lightwhite),
                                  underline:
                                  Container(
                                    height: 2,
                                    color: Colors
                                        .transparent,
                                  ),

                                  onChanged: (String? value) {
                                    // This is called when the user selects an item.
                                    setState(() {
                                      dropdownValue = value!;
                                      yearSelection = int.parse(dropdownValue);
                                    });
                                  },
                                  items: yearList.map<DropdownMenuItem<String>>((String value) {
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
                                initialIndex: monthSelection -1,
                                length: 12,
                                child: TabBar(


                                  indicator: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: MyColors.pinkHex),
                                  isScrollable: true,
                                  indicatorColor: Colors.black,
                                  labelColor: MyColors.customYellow,


                                  onTap: (index){
                                    setState((){
                                      monthSelection = index+1;
                                    });

                                  },
                                  tabs: tabs
                                      .map((tab) => Tab(
                                    icon: Padding(
                                      padding: const EdgeInsets.all(4.0),
                                      child: Text(tab,style: TextStyle(fontSize: 12),),
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
                            initialIndex: daySelection - 1,
                            length: 31,
                            child: Column(
                              children: [
                                TabBar(
                                  isScrollable: true,
                                  indicatorColor:MyColors.pinkHex,
                                  labelColor: MyColors.greenPaste,
                                  onTap: (index) {
                                    setState(() {
                                      daySelection = index + 1;
                                    });
                                  },
                                  tabs: dayTab
                                      .map((tab) => Tab(
                                    icon: Padding(
                                      padding: const EdgeInsets.all(2.0),
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
                      height: Responsive.isMobile(context) ? MediaQuery.of(context).size.height *.5 : MediaQuery.of(context).size.height *.7,
                      child: Row(
                        children: [
                          AttendanceList(),
                          if(!Responsive.isMobile(context))  Report(),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        )

    );
  }



}
