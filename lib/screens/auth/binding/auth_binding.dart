import 'package:get/get.dart';
import 'package:mir_expense_tracker/screens/auth/controller/auth_controller.dart';





class AuthBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AuthController>(
          () => AuthController(),
    );
  }
}
