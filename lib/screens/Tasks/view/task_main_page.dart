import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:drag_and_drop_lists/drag_and_drop_item.dart';
import 'package:drag_and_drop_lists/drag_and_drop_list.dart';
import 'package:drag_and_drop_lists/drag_and_drop_lists.dart';
import 'package:mir_expense_tracker/Utils/my_colors.dart';
import 'package:mir_expense_tracker/constants.dart';
import 'package:mir_expense_tracker/screens/Tasks/controller/task_controller.dart';
import 'package:mir_expense_tracker/screens/auth/controller/auth_controller.dart';
import 'package:mir_expense_tracker/screens/dashboard/view/components/header.dart';
import 'package:mir_expense_tracker/screens/A_main/components/side_menu.dart';
import 'package:mir_expense_tracker/screens/A_main/controller/home_main_controller.dart';
import 'package:mir_expense_tracker/controllers/MenuAppController.dart';
import 'package:mir_expense_tracker/responsive.dart';
import 'package:mir_expense_tracker/screens/dashboard/view/dashboard_screen.dart';
import 'package:flutter/material.dart';
import 'package:mir_expense_tracker/screens/transaction/controller/transaction_controller.dart';
import 'package:provider/provider.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:intl/intl.dart';
import '../../../routes/app_pages.dart';

class TaskListView extends GetView<TaskController> {
  const TaskListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Obx(() {
      return Scaffold(
          key: context.read<MenuAppController>().scaffoldKeyTaskList,
          drawer: SideMenu(),
          floatingActionButton: FloatingActionButton(
            backgroundColor: Colors.purple.withOpacity(.7),
            child: Icon(Icons.add),
            onPressed: () {
              Get.toNamed(Routes.ADDTASK);
            },
          ),
          body: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 10,
                ),
                Header(
                  headerTitle: "TaskList",
                ),
                // SizedBox(height: defaultPadding),
                Scrollbar(
                  isAlwaysShown: true,
                  controller: controller.scrollController,

                  child: Container(
                    width: Responsive.isMobile(context)?MediaQuery.of(context).size.width * 2:MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height *.8,
                    child: DragAndDropLists(
                      scrollController: controller.scrollController,
                      listWidth:Responsive.isMobile(context)? 320: 400,

                      axis: Axis.horizontal,
                      // lastItemTargetHeight: 50,
                      // addLastItemTargetHeightToTop: true,
                      // lastListTargetSize: 30,
                      listPadding: EdgeInsets.all(16),
                      listInnerDecoration: BoxDecoration(
                        color: Theme.of(context).canvasColor,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      children: controller.lists.value,
                      itemDivider: Divider(thickness: 2, height: 2, color: MyColors.darkOrrange),
                      itemDecorationWhileDragging: BoxDecoration(
                        color: cardColor,
                        boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 4)],
                      ),
                      listDragHandle: controller.buildDragHandle(isList: true),
                      itemDragHandle: controller.buildDragHandle(),
                      onItemReorder: controller.onReorderListItem,
                      onListReorder: controller.onReorderList,
                    ),
                  ),
                ),
              ],
            ),
          ));
    });
  }
}
