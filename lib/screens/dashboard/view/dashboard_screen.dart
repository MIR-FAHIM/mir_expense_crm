import 'package:flutter_svg/svg.dart';
import 'package:mir_expense_tracker/responsive.dart';
import 'package:mir_expense_tracker/screens/dashboard/view/chartss/bar_chart.dart';
import 'package:mir_expense_tracker/screens/dashboard/view/chartss/funnel_chart.dart';
import 'package:mir_expense_tracker/screens/dashboard/view/components/my_fields.dart';
import 'package:flutter/material.dart';

import '../../../constants.dart';
import '../view/components/header.dart';

import '../view/components/recent_files.dart';
import '../view/components/balance_board.dart';

class DashboardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        primary: false,
        padding: EdgeInsets.all(defaultPadding),
        child: Column(
          children: [
            Header(headerTitle: "Dashboard",),
            SizedBox(height: defaultPadding),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (Responsive.isMobile(context))
                      Container(
                          height: MediaQuery.of(context).size.height * .3,
                          width: MediaQuery.of(context).size.width * .9,
                          child: BalanceBoard()),
                    Container(
                        height: Responsive.isMobile(context)
                            ? MediaQuery.of(context).size.height * .45
                            : MediaQuery.of(context).size.height * .25,
                        width: Responsive.isMobile(context)
                            ? MediaQuery.of(context).size.width * .9
                            : MediaQuery.of(context).size.width * .5,
                        child: MyFiles()),






                    Container(
                      height: MediaQuery.of(context).size.height * .4,
                      width: MediaQuery.of(context).size.width - 40,
                      child: BarChartSample2(),
                    ),


                  ],
                ),

              ],
            )
          ],
        ),
      ),
    );
  }
}
