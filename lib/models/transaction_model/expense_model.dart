import 'package:cloud_firestore/cloud_firestore.dart';

class TransactionModel {
  final String? user;
  final String? type;
  final String? transName;
  final String? cat;
  final int? id;
  final String? project;
  final String? des;
  final double? amount;
  final String? date;

  TransactionModel(
      {this.user,
      this.project,
      this.id,
        this.des,
      this.type,
        this.date,
      this.cat,
      this.transName,
      this.amount});

  Map<String, dynamic> toMap() {
    return {
      'user': user,
      'project': project,
      "id": id,
      "trans_name": transName,
      "type": type,
      "amount": type,
      "category": cat,
      "des": des,
      "date": date,
    };
  }

  TransactionModel.fromDocumentSnapshot(
      DocumentSnapshot<Map<String, dynamic>> doc)
      : user = doc.data()!["user"],
        project = doc.data()!["project"],
        id = doc.data()!["id"],
        type = doc.data()!["type"],
        date = doc.data()!["date"],
        cat = doc.data()!["category"],
        des = doc.data()!["des"],
        amount = double.parse(doc.data()!["amount"]),
        transName = doc.data()!["trans_name"];
}
