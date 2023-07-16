
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mir_expense_tracker/models/auth_model/login_model.dart';
import 'package:mir_expense_tracker/models/transaction_model/expense_model.dart';
import 'package:mir_expense_tracker/repositories/auth_rep/auth_rep.dart';
import 'package:mir_expense_tracker/routes/app_pages.dart';
import 'package:mir_expense_tracker/services/auth_service.dart';



class AttendanceController extends GetxController with GetSingleTickerProviderStateMixin{
  //TODO: Implement LoginController
  var _db = FirebaseFirestore.instance.collection('mir_expense_tracker')
      .doc("9dP3oajtd2Q7JWoqAAd7")
      .collection("transaction");
  var emailController = TextEditingController().obs;
  var passController = TextEditingController().obs;
  final visible = 0.obs;
  final selectCat = "".obs;
  final dropDownValue11 = "".obs;
  final yearList = [].obs;
  late AnimationController animationController;
  final scrollController = ScrollController().obs;
  var yearSelection = 0.obs;
  final status = true.obs;
  final end = 0.0.obs;
  final monthSelection = 0.obs;
  final daySelection = 0.obs;
  final monthList = [].obs;
  final response = [].obs;
  final transactionList = <TransactionModel>[].obs;
  final dayTab = [].obs;
  String dropdownValue = DateTime.now().year.toString();
  final circularProgressIndicatorValue = 0.0.obs;
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
    retrieveTransaction().then((value) {
      transactionList.value = value ;
    });
    animationController = AnimationController(
      duration: Duration(seconds: 2),
      vsync: this,
    );
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    animationController.dispose();
    transactionList.clear();
    super.onClose();
  }
  Future<List<TransactionModel>> retrieveTransaction() async {
    QuerySnapshot<Map<String, dynamic>> snapshot =
    await _db.get();
    return snapshot.docs
        .map((docSnapshot) => TransactionModel.fromDocumentSnapshot(docSnapshot))
        .toList();
  }


  addTransaction(TransactionModel employeeData) async {
    await _db.add(employeeData.toMap());
  }

  updateTransaction(TransactionModel employeeData) async {
    await _db.doc(employeeData.user).update(employeeData.toMap());
  }

  Future<void> deleteTransaction(String documentId) async {
    await _db.doc(documentId).delete();

  }
  Future getTime() async {
    print("working get time");

  }
  addExpenseController(){

    FirebaseFirestore.instance.collection('mir_expense_tracker')
        .doc("9dP3oajtd2Q7JWoqAAd7")
        .collection("transaction")
        .add({
      "trans_name": passController.value.text,
      "des": passController.value.text,
      "id": "1",
      "amount": passController.value.text,
      "type": "expense",

      "category": "ww",
      "project": "tt",
      "date": passController.value.text.isEmpty  ? DateTime.now().toString() :passController.value.text,
      "user": "yy",

      //"image": downloadUrl!,
    });
  }

}
