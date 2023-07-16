

import 'package:flutter/material.dart';
import 'package:mir_expense_tracker/constants.dart';
import 'package:mir_expense_tracker/models/MyFiles.dart';
import 'package:mir_expense_tracker/screens/Tasks/dragableTasks/task_main_page.dart';
import 'package:mir_expense_tracker/screens/dashboard/view/components/file_info_card.dart';

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