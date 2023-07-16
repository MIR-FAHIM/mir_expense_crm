
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mir_expense_tracker/models/auth_model/login_model.dart';
import 'package:mir_expense_tracker/models/project_model.dart';
import 'package:mir_expense_tracker/models/prospect_model.dart';
import 'package:mir_expense_tracker/models/transaction_model/expense_model.dart';
import 'package:mir_expense_tracker/models/transaction_model/trans_category_model.dart';
import 'package:mir_expense_tracker/repositories/auth_rep/auth_rep.dart';
import 'package:mir_expense_tracker/routes/app_pages.dart';
import 'package:mir_expense_tracker/screens/project/controller/project_controller.dart';
import 'package:mir_expense_tracker/services/auth_service.dart';



class ProspectController extends GetxController {

  final retrvProject = Get.find<ProjectController>().retrieveProject();
  //TODO: Implement LoginController
  var _db = FirebaseFirestore.instance.collection('mir_expense_tracker')
      .doc("9dP3oajtd2Q7JWoqAAd7");
  var mobileController = TextEditingController().obs;
  var emailController = TextEditingController().obs;

  var nameController = TextEditingController().obs;
  var noteController = TextEditingController().obs;
  var addressController = TextEditingController().obs;
  final visible = 0.obs;

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
  final prospectList = <ProspectModel>[].obs;


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



    retrieveProspect().then((value) {

      print("my transaction value is $value");
      prospectList.value = value ;



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


    prospectList.clear();
    super.onClose();
  }
  Future<List<ProspectModel>> retrieveProspect() async {
    QuerySnapshot<Map<String, dynamic>> snapshot =
    await _db .collection("prospect").get();
    return snapshot.docs
        .map((docSnapshot) => ProspectModel.fromDocumentSnapshot(docSnapshot))
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

  addProspectController(){
    print("prospect working 111111");

    var data = FirebaseFirestore.instance
        .collection('mir_expense_tracker')
        .doc("9dP3oajtd2Q7JWoqAAd7")
       .collection("prospect")
        .add(
        {
      "prospect_name": nameController.value.text,
      "note": noteController.value.text,
      "email": emailController.value.text,
          "mobile": mobileController.value.text,
      "address": addressController.value.text,
      "type": "organization",
    }
    );

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
