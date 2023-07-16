import 'package:flutter/material.dart';
import 'package:mir_expense_tracker/constants.dart';
import 'package:mir_expense_tracker/screens/transaction/controller/transaction_controller.dart';
import 'package:collection/collection.dart';
import 'chart.dart';
import 'storage_info_card.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mir_expense_tracker/Utils/app_colors/app_color.dart';
import 'package:mir_expense_tracker/screens/auth/controller/auth_controller.dart';
import 'package:mir_expense_tracker/screens/A_main/components/side_menu.dart';
import 'package:mir_expense_tracker/screens/A_main/controller/home_main_controller.dart';
import 'package:mir_expense_tracker/controllers/MenuAppController.dart';
import 'package:mir_expense_tracker/responsive.dart';
import 'package:mir_expense_tracker/screens/dashboard/view/dashboard_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';







class BalanceBoard extends GetView<TransactionController> {
  const BalanceBoard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Obx(
       () {
        return controller.transactionList.isEmpty ?Container(): SingleChildScrollView(
          child: Container(
          padding: EdgeInsets.all(defaultPadding),
          decoration: BoxDecoration(
        color: secondaryColor,
        borderRadius: const BorderRadius.all(Radius.circular(10)),
          ),
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: 80,
                      width: 120,
                      //  color: Colors.blue.withOpacity(.5),
                      child:Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            Text(
                              "Total Income",
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Text(
                              "${controller.totalIncome.value} tk",
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.green
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      //  color: Colors.redAccent.withOpacity(.5),
                      child:Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(

                          children: [
                            Text(
                              "Total Expense",
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Text(
                              "${controller.totalExpense.value} tk",
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.red
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),

                  ],
                ),
              ),

              Container(
                  height: 200,
                  width: 200,
                  child: ChartBalanceBoard()),
            ],
          ),






        ],
          ),
        ),
        );
      }
    );

  }
}



