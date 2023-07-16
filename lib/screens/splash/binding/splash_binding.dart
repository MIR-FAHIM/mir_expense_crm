import 'package:get/get.dart';
import 'package:mir_expense_tracker/screens/splash/controller/splash_controller.dart';




class SplashscreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SplashscreenController>(
          () => SplashscreenController(),
    );
  }
}
