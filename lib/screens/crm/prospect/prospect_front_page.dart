import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mir_expense_tracker/Utils/my_colors.dart';
import 'package:mir_expense_tracker/constants.dart';
import 'package:mir_expense_tracker/controllers/MenuAppController.dart';
import 'package:mir_expense_tracker/responsive.dart';
import 'package:mir_expense_tracker/screens/crm/prospect/organization_prospect_list.dart';
import 'package:mir_expense_tracker/screens/dashboard/view/components/header.dart';
import 'package:mir_expense_tracker/screens/A_main/components/side_menu.dart';
import 'package:provider/provider.dart';


class ProspectFront extends StatelessWidget {
  const ProspectFront({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        key: context.read<MenuAppController>().scaffoldKeyPrs,
        drawer: SideMenu(),

        body:

        SafeArea(

          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (Responsive.isDesktop(context))
                Expanded(
                  // default flex = 1
                  // and it takes 1/6 part of the screen
                  child: SideMenu(),
                ),
              Expanded(
                flex: 5,
                child: Column(
                  children: [
                    Header(
                      headerTitle: "Prospect",
                    ),
                    SizedBox(height: defaultPadding),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: Container(
                        width: 600,
                        child: Row(
                          children: [
                            Expanded(
                              flex: 3,
                              child: TabBar(
                                indicatorColor: MyColors.customYellow,
                                labelColor: MyColors.customBlue,
                                unselectedLabelColor: MyColors.accentDark,
                                unselectedLabelStyle: const TextStyle(
                                    fontSize: 12
                                ),
                                labelStyle: const TextStyle(
                                    fontSize: 12, fontWeight: FontWeight.w600
                                ),
                                isScrollable: true,
                                tabs: const [
                                  Tab(
                                    text: 'Organization Prospect',
                                  ),
                                  Tab(
                                    text: 'Individual Prospect',
                                  ),

                                ],
                              ),
                            ),
                            Expanded(child: Container())
                          ],
                        ),
                      ),
                    ),
                    const Expanded(
                      child: TabBarView(
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 10.0),
                              child: OrganizationProspect(),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 10.0),
                              child: OrganizationProspect(),
                            )
                          ]),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
