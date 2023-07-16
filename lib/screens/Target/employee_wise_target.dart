import 'package:mir_expense_tracker/models/MyFiles.dart';
import 'package:mir_expense_tracker/responsive.dart';
import 'package:flutter/material.dart';
import 'package:mir_expense_tracker/screens/Tasks/dragableTasks/task_main_page.dart';
import 'package:mir_expense_tracker/screens/crm/prospect/create_propect/create_propect_front.dart';
import 'package:mir_expense_tracker/screens/crm/prospect/create_propect/create_prospect.dart';
import 'package:mir_expense_tracker/screens/dashboard/view/components/file_info_card.dart';
import 'package:mir_expense_tracker/screens/dashboard/view/components/header.dart';

import '../../../constants.dart';


class EmployeeWiseTargetWidget extends StatelessWidget {
  const EmployeeWiseTargetWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size _size = MediaQuery.of(context).size;
    return Column(
      children: [
        Header(
          headerTitle: "Target",
        ),
        SizedBox(height: defaultPadding),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [

            ElevatedButton.icon(
              style: TextButton.styleFrom(
                padding: EdgeInsets.symmetric(
                  horizontal: defaultPadding * 1.5,
                  vertical:
                  defaultPadding / (Responsive.isMobile(context) ? 2 : 1),
                ),
              ),
              onPressed: () {
                // Navigator.pushAndRemoveUntil<dynamic>(
                //   context,
                //   MaterialPageRoute<dynamic>(
                //     builder: (BuildContext context) => CreateProspectMainPage(),
                //   ),
                //       (route) =>
                //   false, //if you want to disable back feature set to false
                // );
              },
              icon: Icon(Icons.add),
              label: Text("Add Target"),
            ),
          ],
        ),
        SizedBox(height: defaultPadding),
        Responsive(
          mobile: FileInfoCardGridView(
            crossAxisCount: _size.width < 700 ? 2 : 4,
            childAspectRatio: _size.width < 700 && _size.width > 350 ? 1.3 : 1,
          ),
          tablet: FileInfoCardGridView(),
          desktop: FileInfoCardGridView(
            childAspectRatio: _size.width < 1400 ? 1.1 : 1.4,
          ),
        ),
      ],
    );
  }
}

class FileInfoCardGridView extends StatelessWidget {
  const FileInfoCardGridView({
    Key? key,
    this.crossAxisCount = 4,
    this.childAspectRatio = 1,
  }) : super(key: key);

  final int crossAxisCount;
  final double childAspectRatio;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: demoMyFiles.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
        crossAxisSpacing: defaultPadding,
        mainAxisSpacing: defaultPadding,
        childAspectRatio: childAspectRatio,
      ),
      itemBuilder: (context, index) => GestureDetector(
          onTap: (){
            Navigator.pushAndRemoveUntil<dynamic>(
              context,
              MaterialPageRoute<dynamic>(

                builder: (BuildContext context) => MainPage(),
              ),
                  (route) => false,//if you want to disable back feature set to false
            );
          },

          child: FileInfoCard(info: demoMyFiles[index])),
    );
  }
}
