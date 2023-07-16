import 'package:cloud_firestore/cloud_firestore.dart';

class ProspectModel {
  final String? prospectName;
  final String? prospectNoteDes;
  final String? prospectID;
  final String? prospectMobile;
  final String? prospectEmail;
  final String? prospectType;





  ProspectModel(
      {
        this.prospectName,
        this.prospectNoteDes,
        this.prospectID,
        this.prospectEmail,
        this.prospectMobile,
        this.prospectType
      });

  Map<String, dynamic> toMap() {
    return {
      'prospect_name': prospectName,
      'note': prospectNoteDes,
      'mobile': prospectMobile,
      'email': prospectEmail,
      'type': prospectType,
      'id': prospectID,



    };
  }

  ProspectModel.fromDocumentSnapshot(DocumentSnapshot<Map<String, dynamic>> doc)
      : prospectName = doc.data()!["prospect_name"],
        prospectNoteDes = doc.data()!["note"],
        prospectMobile = doc.data()!["mobile"],
        prospectEmail = doc.data()!["email"],
        prospectID = doc.id,
        prospectType = doc.data()!["type"];



}