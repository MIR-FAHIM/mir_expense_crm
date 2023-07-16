import 'package:get/get.dart';
import 'package:mir_expense_tracker/screens/Tasks/binding/task_binding.dart';
import 'package:mir_expense_tracker/screens/Tasks/view/activity.dart';
import 'package:mir_expense_tracker/screens/Tasks/view/task_add_view.dart';
import 'package:mir_expense_tracker/screens/Tasks/view/task_main_page.dart';
import 'package:mir_expense_tracker/screens/attendance/attendance_main_page.dart';
import 'package:mir_expense_tracker/screens/attendance/binding/attendance_binding.dart';
import 'package:mir_expense_tracker/screens/attendance/view/attendance_main_page.dart';
import 'package:mir_expense_tracker/screens/attendance/view/give_attendance.dart';
import 'package:mir_expense_tracker/screens/auth/binding/auth_binding.dart';
import 'package:mir_expense_tracker/screens/auth/view/login_view.dart';
import 'package:mir_expense_tracker/screens/contact_list/binding/contact_binding.dart';
import 'package:mir_expense_tracker/screens/contact_list/view/add_contact.dart';
import 'package:mir_expense_tracker/screens/contact_list/view/contact_list_view.dart';
import 'package:mir_expense_tracker/screens/crm/clients/binding/client_binding.dart';
import 'package:mir_expense_tracker/screens/crm/clients/view/add_clients.dart';
import 'package:mir_expense_tracker/screens/crm/clients/view/client_list.dart';
import 'package:mir_expense_tracker/screens/crm/prospect/binding/prospect_binding.dart';
import 'package:mir_expense_tracker/screens/crm/prospect/controller/prospect_controller.dart';
import 'package:mir_expense_tracker/screens/crm/prospect/create_propect/create_propect_front.dart';
import 'package:mir_expense_tracker/screens/crm/prospect/create_propect/create_prospect.dart';
import 'package:mir_expense_tracker/screens/dashboard/view/components/balance_board.dart';
import 'package:mir_expense_tracker/screens/A_main/binding/home_main_binding.dart';
import 'package:mir_expense_tracker/screens/A_main/view/home.dart';
import 'package:mir_expense_tracker/screens/masum/donation/view/donation_view.dart';
import 'package:mir_expense_tracker/screens/project/biniding/project_binding.dart';
import 'package:mir_expense_tracker/screens/project/view/project_add_form.dart';
import 'package:mir_expense_tracker/screens/project/view/project_list.dart';
import 'package:mir_expense_tracker/screens/splash/binding/splash_binding.dart';
import 'package:mir_expense_tracker/screens/splash/view/splash_view.dart';
import 'package:mir_expense_tracker/screens/team/binding/team_binding.dart';
import 'package:mir_expense_tracker/screens/team/view/add_teammate.dart';
import 'package:mir_expense_tracker/screens/team/view/team_view_list.dart';
import 'package:mir_expense_tracker/screens/transaction/binding/transaction_binding.dart';
import 'package:mir_expense_tracker/screens/transaction/view/add_category.dart';
import 'package:mir_expense_tracker/screens/transaction/view/add_expense.dart';
import 'package:mir_expense_tracker/screens/transaction/view/expense_list_view.dart';
import 'package:mir_expense_tracker/screens/transaction/view/income_list_view.dart';
import 'package:mir_expense_tracker/screens/transaction/view/transaction_page.dart';

import '../screens/masum/donation/binding/donation_binding.dart';



part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SPLASHSCREEN;

  static final routes = [
    GetPage(
      name: _Paths.LOGIN,
      page: () => const LoginView(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: _Paths.SPLASHSCREEN,
      page: () =>  SplashscreenView(),
      binding: SplashscreenBinding(),
    ),
    GetPage(
      name: _Paths.HOME,
      page: () =>  HomeView(),
      binding: MainHomeBinding(),
    ),

    GetPage(
      name: _Paths.ADDEXPENSE,
      page: () =>  AddExpenseView(),
      binding: TransactionBinding(),
    ),
    GetPage(
      name: _Paths.CONTACTLIST,
      page: () =>  ContactList(),
      binding: ContactBinding(),
    ),
    GetPage(
      name: _Paths.ADDCONTACT,
      page: () =>  ContactAddForm(),
      binding: ContactBinding(),
    ),

    GetPage(
      name: _Paths.TRANSACTION,
      page: () =>  TransactionView(),
      binding: TransactionBinding(),
    ),
    GetPage(
      name: _Paths.ACTIVITY,
      page: () =>  ActivityPage(),
      binding: TaskBinding(),
    ),
    GetPage(
      name: _Paths.ADDCAT,
      page: () =>  CategoryAddForm(),
      binding: TransactionBinding(),
    ),

    GetPage(
      name: _Paths.ADDCLIENT,
      page: () =>  AddClient(),
      binding: ClientBinding(),
    ),

    GetPage(
      name: _Paths.EXPENSELIST,
      page: () =>  ExpenseListView(),
      binding: TransactionBinding(),
    ),
    GetPage(
      name: _Paths.CLIENTLIST,
      page: () =>  ClientList(),
      binding: ClientBinding(),
    ),
    GetPage(
      name: _Paths.TEAMLIST,
      page: () =>  TeamList(),
      binding: TeamBinding(),
    ),
    GetPage(
      name: _Paths.ADDTEAM,
      page: () =>  TeamAddForm(),
      binding: TeamBinding(),
    ),

    GetPage(
      name: _Paths.ATTENDANCEMAIN,
      page: () =>  AttendanceMainPage(),
      binding: AttendanceBinding(),
    ),
    GetPage(
      name: _Paths.GIVEATTENDANCE,
      page: () =>  GiveAttendance(),
      binding: AttendanceBinding(),
    ),
    GetPage(
      name: _Paths.PROJECTLIST,
      page: () =>  ProjectList(),
      binding: ProjectBinding(),
    ),
    GetPage(
      name: _Paths.PROJECTADD,
      page: () =>  ProjectAddForm(),
      binding: ProjectBinding(),
    ),

    GetPage(
      name: _Paths.BALANCEBOARD,
      page: () =>  BalanceBoard(),
      binding: TransactionBinding(),
    ),
    GetPage(
      name: _Paths.INCOMELIST,
      page: () =>  IncomeListView(),
      binding: TransactionBinding(),
    ),
    GetPage(
      name: _Paths.PROSPECTFORM,
      page: () =>  CreateProspectForm(),
      binding: ProspectBinding(),
    ),
    GetPage(
      name: _Paths.PROSPECTFRONT,
      page: () =>  ProspectFrontPage(),
      binding: ProspectBinding(),
    ),
    GetPage(
      name: _Paths.TASKLIST,
      page: () =>  TaskListView(),
      binding: TaskBinding(),
    ),
    GetPage(
      name: _Paths.ADDTASK,
      page: () =>  AddTaskView(),
      binding: TaskBinding(),
    ),

    // Masum

    GetPage(
      name: _Paths.DONATIONLIST,
      page: () =>  DonationList(),
      binding: DonationBinding(),
    ),

  ];
}
