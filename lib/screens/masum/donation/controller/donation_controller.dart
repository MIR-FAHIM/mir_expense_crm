
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mir_expense_tracker/models/auth_model/login_model.dart';
import 'package:mir_expense_tracker/models/transaction_model/expense_model.dart';
import 'package:url_launcher/url_launcher.dart';



class DonationController extends GetxController {
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


  var yearSelection = 0.obs;


  final monthSelection = 0.obs;
  final daySelection = 0.obs;
  final monthList = [].obs;
  final response = [].obs;
  final transactionList = <TransactionModel>[].obs;
  final dayTab = [].obs;
  String dropdownValue = DateTime.now().year.toString();

  @override
  void onInit() {

    retrieveTransaction().then((value) {
      transactionList.value = value ;
    });
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

  launchWhatsapp(String num) async {
    var whatsapp = "+88${num}";
    var whatsappAndroid =
    Uri.parse("whatsapp://send?phone=$whatsapp&text=hello Sir");
    if (await canLaunchUrl(whatsappAndroid)) {
      await launchUrl(whatsappAndroid);
    } else {

    }
  }

  Future<void> launchPhoneDialer(String contactNumber) async {
    final Uri _phoneUri = Uri(scheme: "tel", path: contactNumber);
    try {
      if (await canLaunch(_phoneUri.toString()))
        await launch(_phoneUri.toString());
    } catch (error) {
      throw ("Cannot dial");
    }
  }

  textMe(num) async {
    // Android
    var uri = 'sms:+88${num.toString()}?body= Hellow Sir';
    if (await canLaunch(uri)) {
      await launch(uri);
    } else {
      // iOS
      const uri = 'sms:+8801782084390?body=hello%20there';
      if (await canLaunch(uri)) {
        await launch(uri);
      } else {
        throw 'Could not launch $uri';
      }
    }
  }

}
