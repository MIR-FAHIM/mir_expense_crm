import 'package:mir_expense_tracker/controllers/MenuAppController.dart';
import 'package:mir_expense_tracker/responsive.dart';
import 'package:mir_expense_tracker/screens/Target/employee_wise_target.dart';
import 'package:mir_expense_tracker/screens/dashboard/view/components/balance_board.dart';
import 'package:mir_expense_tracker/screens/dashboard/view/dashboard_screen.dart';
import 'package:flutter/material.dart';
import 'package:mir_expense_tracker/screens/A_main/components/side_menu.dart';
import 'package:provider/provider.dart';



class TargetMainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: context.read<MenuAppController>().scaffoldKey,
      drawer: SideMenu(),
      body: SafeArea(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // We want this side menu only for large screen
            if (Responsive.isDesktop(context))
              Expanded(
                // default flex = 1
                // and it takes 1/6 part of the screen
                child: SideMenu(),
              ),
            Expanded(
              // It takes 5/6 part of the screen
              flex: 5,
              child:  EmployeeWiseTargetWidget(),
            ),
          ],
        ),
      ),
    );
  }
}
