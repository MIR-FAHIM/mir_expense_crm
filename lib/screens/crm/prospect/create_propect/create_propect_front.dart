import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mir_expense_tracker/Utils/my_colors.dart';
import 'package:mir_expense_tracker/responsive.dart';
import 'package:mir_expense_tracker/routes/app_pages.dart';
import 'package:mir_expense_tracker/screens/crm/prospect/create_propect/organization_prospectList.dart';
import 'package:mir_expense_tracker/screens/dashboard/view/components/header.dart';
import 'package:provider/provider.dart';
import 'package:mir_expense_tracker/constants.dart';
import 'package:mir_expense_tracker/controllers/MenuAppController.dart';
import 'package:mir_expense_tracker/screens/A_main/components/side_menu.dart';

import 'package:mir_expense_tracker/screens/crm/prospect/controller/prospect_controller.dart';

class ProspectFrontPage extends GetView<ProspectController> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

      return DefaultTabController(
        length: 2,
        child: Scaffold(
          key: context.read<MenuAppController>().scaffoldKeyPrs,
          floatingActionButton: FloatingActionButton(
            backgroundColor: Colors.purple.withOpacity(.7),
            child: Icon(Icons.add),
            onPressed: () {
              Get.toNamed(Routes.PROSPECTFORM);
            },
          ),
          drawer: SideMenu(),
          body: SafeArea(
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
                                  unselectedLabelStyle:
                                      const TextStyle(fontSize: 12),
                                  labelStyle: const TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w600),
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
                        child: TabBarView(children: [
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 10.0),
                            child: OrganizationListView(),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 10.0),
                            child: OrganizationListView(),
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
