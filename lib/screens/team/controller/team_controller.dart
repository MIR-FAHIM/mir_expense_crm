import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mir_expense_tracker/Utils/get_ui.dart';
import 'package:mir_expense_tracker/models/auth_model/login_model.dart';
import 'package:mir_expense_tracker/models/team_list_model.dart';
import 'package:mir_expense_tracker/models/transaction_model/expense_model.dart';
import 'package:mir_expense_tracker/repositories/auth_rep/auth_rep.dart';
import 'package:mir_expense_tracker/routes/app_pages.dart';
import 'package:mir_expense_tracker/services/auth_service.dart';
import 'package:url_launcher/url_launcher.dart';

class TeamController extends GetxController {
  //TODO: Implement LoginController
  var db = FirebaseFirestore.instance
      .collection('mir_expense_tracker')
      .doc("9dP3oajtd2Q7JWoqAAd7")
      .collection("team").obs;
  var emailController = TextEditingController().obs;
  var passController = TextEditingController().obs;
  var nameController = TextEditingController().obs;
  var addressController = TextEditingController().obs;
  var mobileController = TextEditingController().obs;
  var roleController = TextEditingController().obs;
  var projectController = TextEditingController().obs;
  //var passController = TextEditingController().obs;

  final visible = 0.obs;
  final selectCat = "".obs;
  final dropDownValue11 = "".obs;
  final yearList = [].obs;

  var yearSelection = 0.obs;

  final monthSelection = 0.obs;
  final daySelection = 0.obs;
  final monthList = [].obs;
  final response = [].obs;
  final teamList = <TeamModel>[].obs;
  final dayTab = [].obs;
  String dropdownValue = DateTime.now().year.toString();

  @override
  void onInit() {
    retrieveTeam().then((value) {
      print("11111 my team list is ++++++ ${value.length}");
      teamList.value = value;
      print("my team list is ++++++ ${teamList.value.length}");

    });
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    teamList.clear();
    super.onClose();
  }

  Future<List<TeamModel>> retrieveTeam() async {
    teamList.clear();
    QuerySnapshot<Map<String, dynamic>> snapshot = await db.value.get();
    return snapshot.docs
        .map((docSnapshot) => TeamModel.fromDocumentSnapshot(docSnapshot))
        .toList();

  }

  addTransaction(TransactionModel employeeData) async {
    await db.value.add(employeeData.toMap());
  }

  updateTransaction(TeamModel employeeData) async {
    var data = await db.value.doc(employeeData.id).update(employeeData.toMap());
    return data;
  }

  Future<void> deleteTeamMember(String documentId) async {
   var data = await FirebaseFirestore.instance
        .collection('mir_expense_tracker')
        .doc("9dP3oajtd2Q7JWoqAAd7")
        .collection("team").doc(documentId).delete();

   return data;
  }

  addTeamController() {
    var data = FirebaseFirestore.instance
        .collection('mir_expense_tracker')
        .doc("9dP3oajtd2Q7JWoqAAd7")
        .collection("team")
        .add({
      "member_name": nameController.value.text,
      "mobile": mobileController.value.text,
      "project": projectController.value.text,
      "address": addressController.value.text,
      "role": roleController.value.text,
      "pass": passController.value.text,
      "designation": roleController.value.text,
      "active": true,
    });

    return data;
  }

  launchWhatsapp(String num) async {
    var whatsapp = "+88${num}";
    var whatsappAndroid =
        Uri.parse("whatsapp://send?phone=$whatsapp&text=hello Sir");
    if (await canLaunchUrl(whatsappAndroid)) {
      await launchUrl(whatsappAndroid);
    } else {
      Get.showSnackbar(Ui.errorSnackBar(
          message: "This number has no whatsapp", title: 'Error'.tr));
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
