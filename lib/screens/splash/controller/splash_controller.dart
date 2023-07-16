import 'dart:async';

import 'package:get/get.dart';
import 'package:mir_expense_tracker/routes/app_pages.dart';
import 'package:mir_expense_tracker/screens/project/controller/project_controller.dart';
import 'package:mir_expense_tracker/services/auth_service.dart';
import 'package:get_storage/get_storage.dart';
import '../../transaction/controller/transaction_controller.dart';




class SplashscreenController extends GetxController {
  //TODO: Implement SplashscreenController
  var storage = GetStorage();
  @override
  Future<void> onInit() async {
    Get.lazyPut<TransactionController>(
          () => TransactionController(),

    );
    Get.lazyPut<ProjectController>(
          () => ProjectController(),

    );
    print('SplashscreenController.onInit');

    Timer(const Duration(seconds: 3), () {
      // Get.offAllNamed(Routes.BASE);
     if(storage.hasData("name")) {
       Get.offAllNamed(Routes.HOME);
     } else {
       Get.offAllNamed(Routes.LOGIN);
     }


    });

    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }
}
