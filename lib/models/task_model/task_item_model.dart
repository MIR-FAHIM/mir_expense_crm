import 'package:cloud_firestore/cloud_firestore.dart';

class TaskModel {
  final String? taskName;
  final String? taskDes;
  final String? docID;
  final int? statusID;



  TaskModel(
      {
    this.docID,
        this.statusID,
        this.taskDes,
        this.taskName

      });

  Map<String, dynamic> toMap() {
    return {
      'task_name': taskName,
      'des': taskDes,
      'status': statusID,
      "doc_id": docID,


    };
  }

  TaskModel.fromDocumentSnapshot(DocumentSnapshot<Map<String, dynamic>> doc)
      : taskName = doc.data()!["task_name"],
       taskDes = doc.data()!["task_des"],
       docID = doc.id,


  statusID = doc.data()!["status"];

}