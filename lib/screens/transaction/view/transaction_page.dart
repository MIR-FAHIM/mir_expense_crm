import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mir_expense_tracker/Utils/app_colors/app_color.dart';
import 'package:mir_expense_tracker/constants.dart';
import 'package:mir_expense_tracker/screens/auth/controller/auth_controller.dart';
import 'package:mir_expense_tracker/screens/dashboard/view/components/header.dart';
import 'package:mir_expense_tracker/screens/A_main/components/side_menu.dart';
import 'package:mir_expense_tracker/screens/A_main/controller/home_main_controller.dart';
import 'package:mir_expense_tracker/controllers/MenuAppController.dart';
import 'package:mir_expense_tracker/responsive.dart';
import 'package:mir_expense_tracker/screens/dashboard/view/dashboard_screen.dart';
import 'package:flutter/material.dart';
import 'package:mir_expense_tracker/screens/transaction/view/add_expense.dart';
import 'package:mir_expense_tracker/screens/transaction/view/add_income.dart';
import 'package:provider/provider.dart';







class TransactionView extends GetView<TrackingScrollController> {
  const TransactionView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      key: context.read<MenuAppController>().scaffoldKeyTrans,
      drawer: SideMenu(),
      body: SafeArea(
        child: DefaultTabController(
          initialIndex: 0,
          length: 2,
          child: Scaffold(
            appBar: AppBar(
              title: const Text('Add Transaction'),
              centerTitle: true,
              bottom: const TabBar(
                tabs: <Widget>[
                  Tab(
                    text: "Expense",
                  ),
                  Tab(
                    text: "Income",
                  ),

                ],
              ),
            ),
            body: TabBarView(
                children: [
                 AddExpenseView(),
                  AddIncomeView(),

                ],
              ),
          ),

        ),
      ),
    );
  }
}

