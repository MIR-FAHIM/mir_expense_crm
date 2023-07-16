import 'package:get/get.dart';
import 'package:mir_expense_tracker/screens/attendance/controller/attedance_controller.dart';
import 'package:mir_expense_tracker/screens/auth/controller/auth_controller.dart';
import 'package:mir_expense_tracker/screens/contact_list/controller/contact_controller.dart';
import 'package:mir_expense_tracker/screens/crm/prospect/controller/prospect_controller.dart';
import 'package:mir_expense_tracker/screens/A_main/controller/home_main_controller.dart';
import 'package:mir_expense_tracker/screens/team/controller/team_controller.dart';
import 'package:mir_expense_tracker/screens/transaction/controller/transaction_controller.dart';





class AttendanceBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AttendanceController>(
          () => AttendanceController(),
    );
  }
}
