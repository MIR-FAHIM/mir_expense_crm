import 'package:flutter/material.dart';
import 'package:mir_expense_tracker/screens/Tasks/controller/task_controller.dart';
import 'package:mir_expense_tracker/screens/Tasks/widgets/back_button.dart';
import 'package:mir_expense_tracker/screens/Tasks/widgets/calendar_days.dart';
import 'package:mir_expense_tracker/screens/Tasks/widgets/task_container_calendar.dart';
import '../../../Utils/app_colors/app_color.dart';
import 'package:get/get.dart';
import 'package:flutter/services.dart';
import 'package:mir_expense_tracker/controllers/MenuAppController.dart';
import 'package:provider/provider.dart';



class ActivityPage extends GetView<TaskController> {
  const ActivityPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget _dashedText() {
      return Container(
        padding: EdgeInsets.symmetric(vertical: 15),
        child: Text(
          '------------------------------------------',
          maxLines: 1,
          style:
          TextStyle(fontSize: 20.0, color: Colors.black12, letterSpacing: 5),
        ),
      );
    }
    var size = MediaQuery.of(context).size;

    return Scaffold(
        key: context.read<MenuAppController>().scaffoldKeyClient,
        appBar: AppBar(
          backgroundColor: AppColor.appColor,
          title: Text("Activity"),
          centerTitle: true,
        ),


        body:SafeArea(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(
              20,
              20,
              20,
              0,
            ),
            child: Column(
              children: <Widget>[
                MyBackButton(),
                SizedBox(height: 30.0),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        'Today',
                        style: TextStyle(
                            fontSize: 30.0, fontWeight: FontWeight.w700),
                      ),
                      Container(
                        height: 40.0,
                        width: 120,
                        decoration: BoxDecoration(
                          color: AppColor.kGreen,
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: GestureDetector(
                          onTap: () {

                          },
                          child: Container(

                            child: Center(
                              child: Text(
                                'Add task',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w700,
                                    fontSize: 16),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ]),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'Productive Day',
                      style: TextStyle(
                        fontSize: 18.0,
                        color: Colors.grey,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 30),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Jan, 2023',
                    style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
                  ),
                ),
                SizedBox(height: 20.0),
                Container(
                  height: 58.0,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: days.length,
                    itemBuilder: (BuildContext context, int index) {
                      return CalendarDates(
                        day: days[index],
                        date: dates[index],
                        dayColor: index == 0 ? AppColor.kRed : Colors.white60,
                        dateColor:
                        index == 0 ? AppColor.kRed : AppColor.textColorWhite,
                      );
                    },
                  ),
                ),
                Expanded(
                  child: SingleChildScrollView(
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 20.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Expanded(
                            flex: 1,
                            child: ListView.builder(
                              itemCount: time.length,
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                              itemBuilder: (BuildContext context, int index) =>
                                  Padding(
                                    padding:
                                    const EdgeInsets.symmetric(vertical: 15.0),
                                    child: Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        '${time[index]} ${time[index] > 9 ? 'PM' : 'AM'}',
                                        style: TextStyle(
                                          fontSize: 12.0,
                                          color: Colors.white60,
                                        ),
                                      ),
                                    ),
                                  ),
                            ),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Expanded(
                            flex: 5,
                            child: ListView(
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                              children: <Widget>[
                                _dashedText(),
                                TaskContainer(
                                  title: 'Project Research',
                                  subtitle:
                                  'Discuss with the colleagues about the future plan',
                                  boxColor: AppColor.kLightYellow2,
                                ),
                                _dashedText(),
                                TaskContainer(
                                  title: 'Work on Medical App',
                                  subtitle: 'Add medicine tab',
                                  boxColor: AppColor.kLavender,
                                ),
                                TaskContainer(
                                  title: 'Call',
                                  subtitle: 'Call to david',
                                  boxColor: AppColor.kPalePink,
                                ),
                                TaskContainer(
                                  title: 'Design Meeting',
                                  subtitle:
                                  'Discuss with designers for new task for the medical app',
                                  boxColor: AppColor.kLightGreen,
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
    );
  }
}


