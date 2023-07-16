import 'package:cloud_firestore/cloud_firestore.dart';

class TransactionCategoryModel {
  final String? catName;
  final String? catDes;
  final String? type;

  TransactionCategoryModel({
    this.catName,
    this.catDes,
    this.type,
  });

  Map<String, dynamic> toMap() {
    return {
      'cat_name': catName,
      'cat_des': catDes,
      "type": type,
    };
  }

  TransactionCategoryModel.fromDocumentSnapshot(
      DocumentSnapshot<Map<String, dynamic>> doc)
      : catName = doc.data()!["cat_name"],
        catDes = doc.data()!["cat_des"],
        type = doc.data()!["type"];
}
