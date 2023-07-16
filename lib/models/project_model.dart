import 'package:cloud_firestore/cloud_firestore.dart';

class ProjectModel {
  final String? projectName;
  final String? projectDes;



  ProjectModel(
      {this.projectName,
        this.projectDes,

      });

  Map<String, dynamic> toMap() {
    return {
      'project_name': projectName,
      'des': projectDes,


    };
  }

  ProjectModel.fromDocumentSnapshot(DocumentSnapshot<Map<String, dynamic>> doc)
      : projectName = doc.data()!["project_name"],

        projectDes = doc.data()!["des"];

}