import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mir_expense_tracker/models/auth_model/login_model.dart';
import 'package:mir_expense_tracker/repositories/auth_rep/auth_rep.dart';
import 'package:mir_expense_tracker/routes/app_pages.dart';
import 'package:mir_expense_tracker/screens/transaction/controller/transaction_controller.dart';
import 'package:mir_expense_tracker/services/auth_service.dart';



class HomeController extends GetxController {
  //TODO: Implement LoginController

  var emailController = TextEditingController().obs;
  var passController = TextEditingController().obs;
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
    AuthRepository().userLogin(emailController.value.text, passController.value.text).then((e) async{

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
    AuthRepository().registration(emailController.value.text, passController.value.text).then((e) async{

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
}
