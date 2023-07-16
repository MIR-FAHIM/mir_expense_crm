import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mir_expense_tracker/Utils/my_colors.dart';
import 'package:mir_expense_tracker/models/auth_model/login_model.dart';
import 'package:mir_expense_tracker/models/task_model/draggable_list_model.dart';
import 'package:mir_expense_tracker/models/task_model/task_item_model.dart';
import 'package:mir_expense_tracker/models/transaction_model/expense_model.dart';
import 'package:mir_expense_tracker/repositories/auth_rep/auth_rep.dart';
import 'package:mir_expense_tracker/routes/app_pages.dart';
import 'package:intl/intl.dart';
import 'package:drag_and_drop_lists/drag_and_drop_lists.dart';
import 'package:mir_expense_tracker/screens/Tasks/dragableTasks/model_drag.dart';

class TaskController extends GetxController {
  //TODO: Implement LoginController
  var _db = FirebaseFirestore.instance
      .collection('mir_expense_tracker')
      .doc("9dP3oajtd2Q7JWoqAAd7")
      .collection("task");
  var emailController = TextEditingController().obs;
  var passController = TextEditingController().obs;
  final visible = 0.obs;
  final selectCat = "".obs;
  final dropDownValue11 = "".obs;
  final yearList = [].obs;
  ScrollController scrollController = ScrollController();
  final result = <DraggableListModel>[].obs;
  var yearSelection = 0.obs;
  final lists = <DragAndDropList>[].obs;
  final olderItemsList = <DragAndDropItem>[].obs;
  final newListItemsList = <DragAndDropItem>[].obs;
  final itemsss = <TaskModel>[].obs;
  final taskList = <TaskModel>[].obs;
  final children = <TaskModel>[].obs;
  List<HeaderModel> headerList = <HeaderModel>[
    HeaderModel(id: 1, header: "New Tasks"),
    HeaderModel(id: 2, header: "In Progress"),
    HeaderModel(id: 3, header: "Need Clarifications"),
    HeaderModel(id: 4, header: "Last Stage"),
    HeaderModel(id: 5, header: "Completed"),
    HeaderModel(id: 6, header: "Cancel"),
  ].obs;
  final monthSelection = 0.obs;
  final daySelection = 0.obs;
  final monthList = [].obs;
  final response = [].obs;

  final dayTab = [].obs;

  String dropdownValue = DateTime.now().year.toString();

  @override
  void onInit() {


    retrieveTask().then((value) {
      taskList.value = value;
      itemsss.value = value;
      print("my task list ++++++++ ${itemsss.length}");
      print("my task status ++++++++ ${itemsss[0].statusID}");
    }).then((e){
      makeNewList();

        lists.value = result.value.map(buildList).toList();


    });

    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    taskList.clear();
    super.onClose();
  }

  Future<List<TaskModel>> retrieveTask() async {
    QuerySnapshot<Map<String, dynamic>> snapshot = await _db.get();
    return snapshot.docs
        .map((docSnapshot) => TaskModel.fromDocumentSnapshot(docSnapshot))
        .toList();
  }

  addTransaction(TransactionModel employeeData) async {
    await _db.add(employeeData.toMap());
  }

  updateTask(TaskModel tm) async {
    await _db.doc(tm.docID).update(tm.toMap());
  }

  Future<void> deleteTransaction(String documentId) async {
    await _db.doc(documentId).delete();
  }

  addTaskController() {
    print("task is adding _________");
    var data = FirebaseFirestore.instance
        .collection('mir_expense_tracker')
        .doc("9dP3oajtd2Q7JWoqAAd7")
        .collection("task")
        .add({
      "task_name": "ttt",
      "des": "des destt ...",
      "status": 1,
      "date": DateTime.now().toString()
    });
    print("task is adding _________${[data.toString()]}");
    return data;
  }

  DragAndDropList buildList(DraggableListModel list) => DragAndDropList(
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
                    item.taskName!,
                    style: TextStyle(fontSize: 12, color: Colors.blue),
                  ),
                  subtitle: Text(
                    "sdhfjshdjhj sjdhj sfdhsuhu  sruhutsr sgruu s uhgsuu usfghsu gsu",
                    style: TextStyle(fontSize: 10, color: Colors.white),
                  ),
                )))
            .toList(),
      );
  makeNewList() {
    headerList.forEach((modelA) {
      children.value = itemsss.value
          .where((modelB) => modelB.statusID == modelA.id)
          .toList();


      print("my all list length are ++++ ${children.value.length}");
      result.value.add(DraggableListModel(
        header: modelA,
        items: children.value,
      ));

    });

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

  void onReorderListItem(
    int oldItemIndex,
    int oldListIndex,
    int newItemIndex,
    int newListIndex,
  ) {
    //updateTask(TaskModel(statusID: 3));
    olderItemsList.value = lists[oldListIndex].children;
    newListItemsList.value = lists[newListIndex].children;

    final movedItem = olderItemsList.value.removeAt(oldItemIndex);
    newListItemsList.value.insert(newItemIndex, movedItem);
  }

  void onReorderList(
    int oldListIndex,
    int newListIndex,
  ) {
    final movedList = lists.value.removeAt(oldListIndex);
    lists.value.insert(newListIndex, movedList);
  }
}

List<String> days = [
  'Sun',
  'Mon',
  'Tue',
  'Wed',
  'Thu',
  'Fri',
  'Sat',
  'Sun',
  'Mon',
  'Tue',
  'Wed',
  'Thu',
  'Fri',
  'Sat'
];
List<String> dates = [
  '5',
  '6',
  '7',
  '8',
  '9',
  '10',
  '11',
  '12',
  '13',
  '14',
  '15',
  '16',
  '17',
  '18'
];

List<int> time = [9, 10, 11, 12, 1, 2, 3, 4, 5, 6, 7, 8];
