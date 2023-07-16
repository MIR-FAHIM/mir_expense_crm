
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mir_expense_tracker/models/auth_model/login_model.dart';
import 'package:mir_expense_tracker/models/project_model.dart';
import 'package:mir_expense_tracker/models/transaction_model/expense_model.dart';
import 'package:mir_expense_tracker/models/transaction_model/trans_category_model.dart';
import 'package:mir_expense_tracker/repositories/auth_rep/auth_rep.dart';
import 'package:mir_expense_tracker/routes/app_pages.dart';
import 'package:mir_expense_tracker/screens/project/controller/project_controller.dart';
import 'package:mir_expense_tracker/services/auth_service.dart';
import 'package:get_storage/get_storage.dart';


class TransactionController extends GetxController {
  final userdata = GetStorage();
  final retrvProject = Get.find<ProjectController>().retrieveProject();
  //TODO: Implement LoginController
  var _db = FirebaseFirestore.instance.collection('mir_expense_tracker')
      .doc("9dP3oajtd2Q7JWoqAAd7");
  var transAmountController = TextEditingController().obs;
  var transactionNameController = TextEditingController().obs;
  var transactionDesController = TextEditingController().obs;
  var dateController = TextEditingController().obs;
  final visible = 0.obs;
  final projectList = <ProjectModel>[].obs;
  final selectCatExpense = "".obs;
  final selectCatIncome = "".obs;
  final selectProject = "".obs;
  final dropDownValue11 = "".obs;
  final yearList = [].obs;
  var catNameController = TextEditingController().obs;
  var catDesController = TextEditingController().obs;
  final catType = "".obs;

  var yearSelection = 0.obs;


  final monthSelection = 0.obs;
  final daySelection = 0.obs;
  final totalIncome = 0.0.obs;
  final totalExpense = 0.0.obs;
final monthList = [].obs;
  final response = [].obs;
  final incomeList = <double>[].obs;
  final expenseList = <double>[].obs;
  final transactionList = <TransactionModel>[].obs;
  final catList = <TransactionCategoryModel>[].obs;

  final dayTab = [].obs;
  String dropdownValue = DateTime.now().year.toString();

  @override
  void onInit() {


    yearList.value = [DateTime.now().year.toString(), DateTime(DateTime.now().year-1).toString().substring(0,4), DateTime(DateTime.now().year-2).toString().substring(0,4) ];
    yearSelection.value = int.parse(DateTime.now().toString().substring(0,4));
   monthSelection.value = int.parse(DateTime.now().toString().substring(5, 7));
   daySelection.value = int.parse(DateTime.now().toString().substring(8, 10));
   monthList.value = [
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
   dayTab.value  = [
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

    retrieveCat().then((value) => catList.value = value).then((value) =>  selectCatIncome.value = catList[0].catName!);

    retrieveTransaction().then((value) {

      print("my transaction value is $value");
      transactionList.value = value ;

      for (var element in transactionList.where((e) => e.type == "income")) {
        incomeList.add(element.amount!);
       totalIncome.value = incomeList.reduce((a, b) => a + b);
      }

      for (var element in transactionList.where((e) => e.type == "expense")) {
        expenseList.add(element.amount!);
        totalExpense.value = expenseList.reduce((a, b) => a + b);
      }

    });
    retrvProject.then((value) {
      projectList.value = value;
      selectProject.value = projectList[0].projectName!;
    });
    selectCatExpense.value == "food";
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {


    transactionList.clear();
    super.onClose();
  }
  Future<List<TransactionModel>> retrieveTransaction() async {
    QuerySnapshot<Map<String, dynamic>> snapshot =
    await _db .collection("transaction").get();
    return snapshot.docs
        .map((docSnapshot) => TransactionModel.fromDocumentSnapshot(docSnapshot))
        .toList();
  }


  addTransaction(TransactionModel employeeData) async {
    await _db.collection("transaction").add(employeeData.toMap());
  }

  updateTransaction(TransactionModel employeeData) async {
    await _db.collection("transaction").doc(employeeData.user).update(employeeData.toMap());
  }

  Future<void> deleteTransaction(String documentId) async {
    await _db.collection("transaction").doc(documentId).delete();

  }

  addExpenseController(){
    transactionList.clear();
  var data = _db.collection("transaction")
        .add({
      "trans_name": transactionNameController.value.text,
      "des": transactionDesController.value.text,
      "id": DateTime.now().millisecond,
      "amount": transAmountController.value.text,
      "type": "expense",

      "category": selectCatExpense.value,
      "project": selectProject.value,
      "date":  DateTime.now().toString(),
      "user": userdata.read("name"),

      //"image": downloadUrl!,
    });

      return data;
  }

  addIncomeController(){

    var data =  _db.collection("transaction")
        .add({
      "trans_name": transactionNameController.value.text,
      "des": transactionDesController.value.text,
      "id": DateTime.now().millisecond,
      "amount": transAmountController.value.text,
      "type": "income",

      "category": selectCatIncome.value,
      "project": selectProject.value,
      "date":  DateTime.now().toString(),
      "user": userdata.read("name"),

      //"image": downloadUrl!,
    });
    return data;
  }
  addCategoryController(){

    var data = _db.collection("category")
        .add({
      "cat_name": catNameController.value.text,
      "cat_des": catDesController.value.text,
      "type": catType.value,
    });
    retrieveCat().then((value) => catList.value = value);

    return data;
  }

  Future<List<TransactionCategoryModel>> retrieveCat() async {
    QuerySnapshot<Map<String, dynamic>> snapshot =
    await _db.collection("category").get();
    return snapshot.docs
        .map((docSnapshot) => TransactionCategoryModel.fromDocumentSnapshot(docSnapshot))
        .toList();
  }

}
