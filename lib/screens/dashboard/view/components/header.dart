import 'package:mir_expense_tracker/Utils/my_colors.dart';
import 'package:mir_expense_tracker/constants.dart';
import 'package:mir_expense_tracker/controllers/MenuAppController.dart';
import 'package:mir_expense_tracker/responsive.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mir_expense_tracker/screens/Tasks/dragableTasks/task_main_page.dart';
import 'package:mir_expense_tracker/screens/attendance/attendance_main_page.dart';
import 'package:mir_expense_tracker/screens/A_main/components/side_menu.dart';

import 'package:provider/provider.dart';

class Header extends StatefulWidget {
  String headerTitle;
  Header({required this.headerTitle});
  @override
  State<Header> createState() => _HeaderState();
}

class _HeaderState extends State<Header> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        if (!Responsive.isDesktop(context))
          IconButton(
            icon: Icon(Icons.menu),
            onPressed: widget.headerTitle == "ExpenseList"
                ? context.read<MenuAppController>().controlMenuExpenseList
                : widget.headerTitle == "IncomeList"
                    ? context.read<MenuAppController>().controlMenu3
                    : widget.headerTitle == "ProjectList"
                        ? context.read<MenuAppController>().controlMenu4
                        : widget.headerTitle == "Attendance"
                            ? context.read<MenuAppController>().controlMenu7
                            : widget.headerTitle == "ClientList"
                                ? context
                                    .read<MenuAppController>()
                                    .controlMenuClt
                                : widget.headerTitle == "TaskList"
                                    ? context
                                        .read<MenuAppController>()
                                        .controlMenuTaskList
                                    : widget.headerTitle == "TeamList"
                                        ? context
                                            .read<MenuAppController>()
                                            .controlMenuTm
                                        : widget.headerTitle == "Prospect"
                                            ? context
                                                .read<MenuAppController>()
                                                .controlMenuPrs
                                            : widget.headerTitle ==
                                                    "ContactList"
                                                ? context
                                                    .read<MenuAppController>()
                                                    .controlMenuContact
                                                : widget.headerTitle ==
                                                        "Donation"
                                                    ? context
                                                        .read<
                                                            MenuAppController>()
                                                        .controlMenuDonation
                                                    : context
                                                        .read<
                                                            MenuAppController>()
                                                        .controlMenu,
          ),
        if (!Responsive.isMobile(context))
          Text(
            widget.headerTitle,
            style: Theme.of(context).textTheme.headline6,
          ),
        if (!Responsive.isMobile(context))
          Spacer(flex: Responsive.isDesktop(context) ? 2 : 1),
        Expanded(child: SearchField()),
        ProfileCard()
      ],
    );
  }
}

class ProfileCard extends StatefulWidget {
  const ProfileCard({
    Key? key,
  }) : super(key: key);

  @override
  State<ProfileCard> createState() => _ProfileCardState();
}

class _ProfileCardState extends State<ProfileCard> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: defaultPadding),
      padding: EdgeInsets.symmetric(
        horizontal: defaultPadding,
        vertical: defaultPadding / 2,
      ),
      decoration: BoxDecoration(
        color: secondaryColor,
        borderRadius: const BorderRadius.all(Radius.circular(10)),
        border: Border.all(color: Colors.white10),
      ),
      child: Row(
        children: [
          Image.asset(
            "assets/images/profile_pic.png",
            height: 38,
          ),
          if (!Responsive.isMobile(context))
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: defaultPadding / 2),
              child: Text("Angelina Jolie"),
            ),
          GestureDetector(
              onTap: () {
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        elevation: 10,
                        backgroundColor: Colors.transparent,
                        content: Card(
                          child: Container(
                            color: MyColors.purpleLight,
                            height: 200,
                            width: 300,
                            child: ListView(
                              children: [
                                DrawerListTile(
                                  title: "Notification",
                                  svgSrc: "assets/icons/menu_notification.svg",
                                  press: () {},
                                ),
                                DrawerListTile(
                                  title: "My Notes",
                                  svgSrc: "assets/icons/menu_profile.svg",
                                  press: () {
                                    // Navigator.pushAndRemoveUntil<dynamic>(
                                    //   context,
                                    //   MaterialPageRoute<dynamic>(
                                    //     builder: (BuildContext context) => ScheduleHomePage(),
                                    //   ),
                                    //       (route) =>
                                    //   false, //if you want to disable back feature set to false
                                    // );
                                  },
                                ),
                                DrawerListTile(
                                  title: "Settings",
                                  svgSrc: "assets/icons/menu_setting.svg",
                                  press: () {},
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    });
              },
              child: Icon(Icons.keyboard_arrow_down)),
        ],
      ),
    );
  }
}

class SearchField extends StatelessWidget {
  const SearchField({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        hintText: "Search",
        fillColor: secondaryColor,
        filled: true,
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: const BorderRadius.all(Radius.circular(10)),
        ),
        suffixIcon: InkWell(
          onTap: () {},
          child: Container(
            padding: EdgeInsets.all(defaultPadding * 0.75),
            margin: EdgeInsets.symmetric(horizontal: defaultPadding / 2),
            decoration: BoxDecoration(
              color: primaryColor,
              borderRadius: const BorderRadius.all(Radius.circular(10)),
            ),
            child: SvgPicture.asset("assets/icons/Search.svg"),
          ),
        ),
      ),
    );
  }
}
