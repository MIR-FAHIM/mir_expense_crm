import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mir_expense_tracker/models/auth_model/login_model.dart';
import 'package:mir_expense_tracker/models/team_list_model.dart';
import 'package:mir_expense_tracker/repositories/auth_rep/auth_rep.dart';
import 'package:mir_expense_tracker/routes/app_pages.dart';
import 'package:mir_expense_tracker/services/auth_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get_storage/get_storage.dart';

class AuthController extends GetxController {
  //TODO: Implement LoginController

  var mobileController = TextEditingController().obs;
  var passController = TextEditingController().obs;
  var _db = FirebaseFirestore.instance.collection('mir_expense_tracker')
      .doc("9dP3oajtd2Q7JWoqAAd7");
  final visible = 0.obs;
  @override
  void onInit() {
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

  loginController() async{
    visible.value++;
    AuthRepository().userLogin(mobileController.value.text, passController.value.text).then((e) async{

      print("my login data");
      if(e != null){
        var data = LoginModel.fromJson(e);
        await Get.find<AuthService>().setUser(data);
        visible.value = 0;
        print("hlw bro ++++++++++ ${Get.find<AuthService>().isAuth.toString()}");
        Get.offAllNamed(Routes.HOME);
      } else {
        print("error ++++++++++++++");
        visible.value = 0;

      }

    });
  }
  registerController() async{
    visible.value++;
    AuthRepository().registration(mobileController.value.text, passController.value.text).then((e) async{

      print("my login data");
      if(e != null){

        visible.value = 0;

        Get.offAllNamed(Routes.LOGIN);
      } else {
        print("error ++++++++++++++");
        visible.value = 0;

      }

    });
  }
  // Future<bool> doesPassExist(String name) async {
  //   print("+++ $name");
  //   final QuerySnapshot result = await _db.collection("team")
  //       .where('role', isEqualTo: name)
  //       .limit(1)
  //       .get();
  //   final List<DocumentSnapshot> documents = result.docs;
  //   print("+++ ${documents.length}");
  //
  //   return documents.length == 1;
  // }




  Future<bool> doesMobileAlreadyExist(String mobile, String pass) async {
    print("+++ $mobile");
    final QuerySnapshot result = await _db.collection("team")
        .where('mobile', isEqualTo: mobile)
    .where('pass', isEqualTo: pass)
        .limit(1)
        .get();
    final List<DocumentSnapshot> documents = result.docs;
    List data = result.docs;
    final userdata = GetStorage();
    userdata.write('name', data[0]["member_name"]);


    print("+++name ${data[0]["member_name"]}");

    if(documents.length == 1){

          Get.offAllNamed(Routes.HOME);

    }
    return documents.length == 1;
  }

}
