import 'package:cloud_firestore/cloud_firestore.dart';

class TeamModel {
  final String?       id;
  final String? name;
  final String? mobile;
  final String? project;
  final String? address;
  final String? role;
  final String? designation;
  final bool? active;


  TeamModel(
      {
        this.project,
        this.id,
        this.name,
        this.address,
        this.mobile,
        this.role,
        this.active,
        this.designation
      });

  Map<String, dynamic> toMap() {
    return {
      "id": id,
      'member_name': name,
      'mobile': mobile,
      "project": project,
      "address": address,
      "role": role,
      "active": active,
      "designation": designation

    };
  }

  TeamModel.fromDocumentSnapshot(
      DocumentSnapshot<Map<String, dynamic>> doc)
      : name = doc.data()!["member_name"],
        project = doc.data()!["project"],
  id = doc.id,
        mobile = doc.data()!["mobile"],
        address = doc.data()!["address"],
        active = doc.data()!["active"],
        designation = doc.data()!["designation"],
        role = doc.data()!["role"];
}
