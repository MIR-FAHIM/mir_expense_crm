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
import 'package:mir_expense_tracker/screens/dashboard/view/components/header.dart';
import 'package:mir_expense_tracker/screens/A_main/components/side_menu.dart';
import 'package:provider/provider.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPage createState() => _MainPage();
}

class _MainPage extends State<MainPage> {
  late List<DragAndDropList> lists;
  late List<DragAndDropList> weblists;
  List<DraggableList> newList = [];
  ScrollController _scrollController = ScrollController();
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
    HeaderModel(id: 1, header: "New Tasks"),
    HeaderModel(id: 2, header: "In Progress"),
    HeaderModel(id: 3, header: "Need Clarifications"),
    HeaderModel(id: 4, header: "Last Stage"),
    HeaderModel(id: 5, header: "Completed"),
    HeaderModel(id: 6, header: "Cancel"),
  ];
  List<DraggableList> result = [];
  makeNewList() {
    headerList.forEach((modelA) {
      var children =
          itemsss.where((modelB) => modelB.status == modelA.id).toList();
      result.add(DraggableList(
        header: modelA,
        items: children,
      ));
    });
  }

  @override
  void initState() {
    super.initState();
    makeNewList();

    lists = result.map(buildList).toList();
    weblists = result.map(webbuildList).toList();
  }

  @override
  Widget build(BuildContext context) {
    final backgroundColor = Color.fromARGB(255, 243, 242, 248);

    return Scaffold(
        key: context.read<MenuAppController>().scaffoldKeyTask,
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
                    Header(
                      headerTitle: "Task",
                    ),
                    SizedBox(height: defaultPadding),
                    Scrollbar(
                      isAlwaysShown: true,
                      controller: _scrollController,
                      child: Container(
                        width: Responsive.isMobile(context)
                            ? MediaQuery.of(context).size.width * 2
                            : MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height * .8,
                        child: DragAndDropLists(
                          scrollController: _scrollController,
                          listWidth: Responsive.isMobile(context) ? 320 : 400,

                          axis: Axis.horizontal,
                          // lastItemTargetHeight: 50,
                          // addLastItemTargetHeightToTop: true,
                          // lastListTargetSize: 30,
                          listPadding: EdgeInsets.all(16),
                          listInnerDecoration: BoxDecoration(
                            color: Theme.of(context).canvasColor,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          children:
                              Responsive.isMobile(context) ? lists : weblists,
                          itemDivider: Divider(
                              thickness: 2,
                              height: 2,
                              color: MyColors.darkOrrange),
                          itemDecorationWhileDragging: BoxDecoration(
                            color: cardColor,
                            boxShadow: [
                              BoxShadow(color: Colors.black12, blurRadius: 4)
                            ],
                          ),
                          listDragHandle: buildDragHandle(isList: true),
                          itemDragHandle: buildDragHandle(),
                          onItemReorder: onReorderListItem,
                          onListReorder: onReorderList,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }

  DragHandle buildDragHandle({bool isList = false}) {
    final verticalAlignment = isList
        ? DragHandleVerticalAlignment.top
        : DragHandleVerticalAlignment.center;
    final color = isList ? Colors.white54 : Colors.white54;

    return DragHandle(
      verticalAlignment: verticalAlignment,
      child: Container(
        padding: EdgeInsets.only(right: 10, left: 10),
        child: Icon(Icons.menu, color: color),
      ),
    );
  }

  DragAndDropList buildList(DraggableList list) => DragAndDropList(
        header: Container(
          padding: EdgeInsets.all(8),
          child: Text(
            list.header.header,
            style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: 16, color: Colors.white),
          ),
        ),
        children: list.items
            .map((item) => DragAndDropItem(
                    child: ListTile(
                  leading: Container(
                      width: 100,
                      height: 105,
                      decoration: BoxDecoration(
                          //color: primaryColorSecond.withOpacity(.3),
                          borderRadius: BorderRadius.circular(6)),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 4.0),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  DateFormat('EEEE')
                                          .format(DateTime.now())
                                          .toString()
                                          .substring(0, 3) +
                                      ",",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  height: 3,
                                ),
                                //"LogTimeIn":"2022-09-13T08:36:40.32"
                                Center(
                                  child: Text(
                                    " " +
                                        DateTime.now()
                                            .toString()
                                            .substring(8, 10),
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontSize: 10,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                Text(
                                  DateFormat('MMM')
                                      .format(DateTime.now())
                                      .toString()
                                      .substring(0, 3),
                                  style: TextStyle(
                                      fontSize: 9, fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                            Card(
                              color: MyColors.pinkHex,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    DateFormat.jm().format(DateTime.now()),
                                    style: TextStyle(
                                        fontSize: 9,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      )),
                  title: Text(
                    item.title,
                    style: TextStyle(fontSize: 12, color: Colors.blue),
                  ),
                  subtitle: Text(
                    "sdhfjshdjhj sjdhj sfdhsuhu  sruhutsr sgruu s uhgsuu usfghsu gsu",
                    style: TextStyle(fontSize: 10, color: Colors.white),
                  ),
                )))
            .toList(),
      );
  DragAndDropList webbuildList(DraggableList list) => DragAndDropList(
        header: Container(
          padding: EdgeInsets.all(8),
          child: Text(
            list.header.header,
            style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: 16, color: Colors.white),
          ),
        ),
        children: list.items
            .map((item) => DragAndDropItem(
                    child: ListTile(
                  leading: Container(
                      width: 80,
                      height: 70,
                      decoration: BoxDecoration(
                          //color: primaryColorSecond.withOpacity(.3),
                          borderRadius: BorderRadius.circular(6)),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 0.0),
                        child: Column(
                          children: [
                            Container(
                              height: 20,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    DateFormat('EEEE')
                                            .format(DateTime.now())
                                            .toString()
                                            .substring(0, 3) +
                                        ",",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(
                                    height: 3,
                                  ),
                                  //"LogTimeIn":"2022-09-13T08:36:40.32"
                                  Center(
                                    child: Text(
                                      " " +
                                          DateTime.now()
                                              .toString()
                                              .substring(8, 10),
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  Text(
                                    DateFormat('MMM')
                                        .format(DateTime.now())
                                        .toString()
                                        .substring(0, 3),
                                    style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ),
                            Card(
                              color: MyColors.pinkHex,
                              child: Container(
                                height: 20,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      DateFormat.jm().format(DateTime.now()),
                                      style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      )),
                  title: Text(
                    item.title,
                    style: TextStyle(fontSize: 14, color: Colors.blue),
                  ),
                  subtitle: Container(
                    width: 100,
                    height: 50,
                    child: Text(
                      "sdhfjshdjhj sjdhj sfdhsuhu  sruhutsr sgruu s uhgsuu usfghsu gsu",
                      maxLines: 2,
                      style: TextStyle(fontSize: 12, color: Colors.white),
                    ),
                  ),
                )))
            .toList(),
      );

  void onReorderListItem(
    int oldItemIndex,
    int oldListIndex,
    int newItemIndex,
    int newListIndex,
  ) {
    setState(() {
      final oldListItems = lists[oldListIndex].children;
      final newListItems = lists[newListIndex].children;

      final movedItem = oldListItems.removeAt(oldItemIndex);
      newListItems.insert(newItemIndex, movedItem);
    });
  }

  void onReorderList(
    int oldListIndex,
    int newListIndex,
  ) {
    setState(() {
      final movedList = lists.removeAt(oldListIndex);
      lists.insert(newListIndex, movedList);
    });
  }
}
