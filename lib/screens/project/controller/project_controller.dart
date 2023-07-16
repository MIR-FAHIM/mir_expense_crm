import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mir_expense_tracker/models/auth_model/login_model.dart';
import 'package:mir_expense_tracker/models/project_model.dart';
import 'package:mir_expense_tracker/repositories/auth_rep/auth_rep.dart';
import 'package:mir_expense_tracker/routes/app_pages.dart';
import 'package:mir_expense_tracker/screens/transaction/controller/transaction_controller.dart';
import 'package:mir_expense_tracker/services/auth_service.dart';

import 'package:cloud_firestore/cloud_firestore.dart';


class ProjectController extends GetxController {
  //TODO: Implement LoginController
  var _db = FirebaseFirestore.instance.collection('mir_expense_tracker')
      .doc("9dP3oajtd2Q7JWoqAAd7");
  var projectNameController = TextEditingController().obs;
  var projectDesController = TextEditingController().obs;

  final projectList = <ProjectModel>[].obs;
  final visible = 0.obs;
  @override
  void onInit() {
    retrieveProject().then((value) => projectList.value = value);

    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  addProjectController(){

    var data = _db.collection("project")
        .add({
      "project_name": projectNameController.value.text,
      "des": projectDesController.value.text,
    });
    retrieveProject().then((value) => projectList.value = value);

    return data;
  }



  Future<List<ProjectModel>> retrieveProject() async {
    QuerySnapshot<Map<String, dynamic>> snapshot =
    await _db.collection("project").get();
    return snapshot.docs
        .map((docSnapshot) => ProjectModel.fromDocumentSnapshot(docSnapshot))
        .toList();
  }

}
