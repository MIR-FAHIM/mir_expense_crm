import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mir_expense_tracker/Utils/app_colors/app_color.dart';
import 'package:mir_expense_tracker/Utils/my_colors.dart';
import 'package:mir_expense_tracker/constants.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:mir_expense_tracker/controllers/MenuAppController.dart';
import 'package:mir_expense_tracker/screens/attendance/controller/attedance_controller.dart';
import 'package:mir_expense_tracker/screens/attendance/demo_attendance_model.dart';
import 'package:intl/intl.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mir_expense_tracker/screens/project/controller/project_controller.dart';
import 'package:provider/provider.dart';

class GiveAttendance extends GetView<AttendanceController> {
  const GiveAttendance({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

      return Scaffold(
       // backgroundColor: primaryColorLight,
        key: context.read<MenuAppController>().scaffoldKey5,
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 50,
              ),
              SizedBox(
                height: 150,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      // crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        GestureDetector(
                          onTap: () {
                           controller.getTime();
                          },
                          child: Text(
                           DateFormat('hh:mm').format(DateTime.now()),
                            style: const TextStyle(
                                fontSize: 60, fontWeight: FontWeight.w300),
                          ),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Text(
                          DateFormat('a').format(DateTime.now()),
                          style: const TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w400),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                        DateFormat.EEEE().format(DateTime.now()),
                          style: const TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w600),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Text(
                         DateFormat.yMd().format(DateTime.now()),
                          style: const TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              TweenAnimationBuilder<double>(
                duration: controller.animationController.duration!,
                    tween: Tween<double>(begin: 0.0, end: controller.end.value),
                    builder: (context, double value, _) {
                      controller.circularProgressIndicatorValue.value = value;
                      return Stack(
                        children: [
                          Center(
                            child: SizedBox(
                              height: 200,
                              width: 200,
                              child: CircularProgressIndicator(
                                color: controller.end.value == 0 ? Colors.blue : Colors.amber,
                                value: controller.circularProgressIndicatorValue.value,
                                backgroundColor: Colors.grey,
                                strokeWidth: 5,
                              ),
                            ),
                          ),
                          Center(
                            child: GestureDetector(
                              onTap: () {
                                controller.animationController.forward();
                              },
                              onLongPress: () async {

                                controller.end.value = 1;
                             //   controller.status.value = true;
                              },
                              onLongPressCancel: () {
                                controller.end.value = 0;
                              },
                              child: Container(
                                height: 200,
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: controller.status.value == true
                                        ? Colors.amber
                                        : Colors.amber),
                                child: Padding(
                                  padding: const EdgeInsets.all(70.0),
                                  child: Image.asset(
                                    'assets/icons/Icons/dash.png',
                                    height: 40,
                                    width: 40,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      );
                    },
                  ),


              SizedBox(
                height: 10,
              ),
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                        onTap: (){
                          print("reapiting");

                          // setState(() {
                          //   locationDis = "";
                          // });


                          // geolocatorService.determinePosition().then((ele) {
                          //
                          //   getAddressFromLatLong(ele!);
                          // });


                        },
                        child: Icon(Icons.repeat, color: Colors.blue, size: 40,)),
                    Icon(Icons.location_on_outlined),
                    SizedBox(
                      width: 10,
                    ),
                    "locationDis" == ""
                        ? Container(
                      height: 15,
                      width: 15,
                      child: CircularProgressIndicator(),
                    )
                        : Text(
                      "locationDis",
                      maxLines: 2,
                      style: TextStyle(fontSize: 8),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Row(
                children: [
                  Expanded(
                    child: Container(),
                  ),
                  Expanded(
                      flex: 6,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Column(
                            children: [
                              Icon(
                                Icons.person,
                                color: primaryColor,
                              ),
                              Text(
                                  DateFormat.jm().format(DateTime.now()),
                                style: TextStyle(fontWeight: FontWeight.w600),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              true == true
                                  ? Text(
                                'Check In',
                                style: TextStyle(
                                    color: Colors.blueAccent,
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold),
                              )
                                  : Text(
                                'Check In',
                                style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              Icon(
                                Icons.person_add_alt,
                                color: primaryColor,
                              ),
                              Text(
                                DateFormat.jm().format(DateTime.now()),
                                style: TextStyle(fontWeight: FontWeight.w600),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              true == true
                                  ? Text(
                                'Check Out',
                                style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold),
                              )
                                  : Text(
                                'Check Out',
                                style: TextStyle(
                                    color: Colors.blueAccent,
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              Icon(
                                Icons.arrow_circle_right,
                                color: primaryColor,
                              ),
                              Text(
                                "totalhrs",
                                style: TextStyle(fontWeight: FontWeight.w600),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                'Working Hour',
                                // status.value.toString(),
                                style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ],
                      )),
                  Expanded(
                    child: Container(),
                  )
                ],
              )
            ],
          ),
        ),
      );

  }

}
