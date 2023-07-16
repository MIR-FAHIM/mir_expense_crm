import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mir_expense_tracker/Utils/app_colors/app_color.dart';
import 'package:mir_expense_tracker/Widget/custom_text_field.dart';
import 'package:mir_expense_tracker/constants.dart';
import 'package:mir_expense_tracker/routes/app_pages.dart';
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






class IncomeListView extends GetView<TransactionController> {
  const IncomeListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Obx(
            () {
          return Scaffold(
              key: context.read<MenuAppController>().scaffoldKey3,
              drawer: SideMenu(),
              floatingActionButton: FloatingActionButton(
                backgroundColor: Colors.purple.withOpacity(.6),
                child: Icon(Icons.add),
                onPressed: (){
                  Get.toNamed(Routes.TRANSACTION);
                },
              ),
              body: SingleChildScrollView(
                child: Column(

                  children: <Widget>[

                    SizedBox(
                      height: size.height * .15,
                      child: Header(
                        headerTitle: "IncomeList",
                      ),
                    ),
                    // SizedBox(height: defaultPadding),
                    Container(
                      height: size.height * .15,
                      child: Column(
                        children: [
                          DefaultTabController(
                            initialIndex: controller.monthSelection.value - 1,
                            length: 12,
                            child: Container(
                              height: 30,
                              child: Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 8),
                                    child: Container(
                                      width: 70,
                                      child: DropdownButton<String>(
                                        value: "2023",
                                        isExpanded: true,
                                        icon: Icon(Icons
                                            .arrow_drop_down_outlined),
                                        elevation: 16,
                                        style: const TextStyle(
                                            color: Colors
                                                .orange),
                                        underline:
                                        Container(
                                          height: 2,
                                          color: Colors
                                              .transparent,
                                        ),

                                        onChanged: (String? value) {
                                          // This is called when the user selects an item.

                                          controller.dropDownValue11.value = value!;
                                          controller.yearSelection.value = int.parse(controller.dropDownValue11.value);

                                        },
                                        items: controller.yearList.map<DropdownMenuItem<String>>((value) {
                                          return DropdownMenuItem<String>(
                                            value: value,
                                            child: Text(value),
                                          );
                                        }).toList(),
                                      ),
                                    ),
                                  ),

                                  Container(
                                    width: MediaQuery.of(context).size.width - 150,

                                    child: DefaultTabController(
                                      initialIndex: controller.monthSelection.value -1,
                                      length: 12,
                                      child: TabBar(


                                        indicator: BoxDecoration(
                                            borderRadius: BorderRadius.circular(10),
                                            color: Colors.green),
                                        isScrollable: true,
                                        indicatorColor: Colors.grey,
                                        labelColor: Colors.white,


                                        onTap: (index){

                                          controller.monthSelection.value = index+1;


                                        },
                                        tabs: controller.monthList
                                            .map((tab) => Tab(
                                          icon: Padding(
                                            padding: const EdgeInsets.all(4.0),
                                            child: Text(tab,style: TextStyle(fontSize: 12),),
                                          ),
                                        ))
                                            .toList(),
                                      ),
                                    ),
                                  ),
                                ],

                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 2.0),
                            child: DefaultTabController(
                              initialIndex: controller.daySelection.value - 1,
                              length: 31,
                              child: Column(
                                children: [
                                  TabBar(
                                    isScrollable: true,
                                    indicatorColor: Colors.grey,
                                    labelColor: Colors.white,
                                    onTap: (index) {

                                      controller.daySelection.value = index + 1;

                                    },
                                    tabs: controller.dayTab
                                        .map((tab) => Tab(
                                      icon: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                          tab.toString(),
                                          style: TextStyle(
                                            fontSize: 12,
                                          ),
                                        ),
                                      ),
                                    ))
                                        .toList(),
                                  ),
                                ],
                              ),
                            ),
                          ),

                        ],
                      ),
                    ),
                    Center(
                      child: Column(
                        children: [
                          Text("Income List "),
                          Text("Total: ${controller.totalIncome.value}", style: TextStyle(color: AppColor.customYellow),),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SizedBox(

                        height: size.height * .5,
                        width: size.width,
                        child: ListView.builder(
                            itemCount: controller.transactionList.where((e) => e.type == "income").length,
                            itemBuilder: (BuildContext con , index){
                              var data = controller.transactionList[index];
                              return Card(
                                color: Colors.purple.withOpacity(.4),
                                child: Row(
                                  children: <Widget>[
                                    Container(
                                        height: 62,
                                        decoration: BoxDecoration(color: AppColor.listTile.withOpacity(.7), borderRadius: BorderRadius.circular(6)),
                                        width: 70,
                                        child: Padding(
                                          padding:
                                          const EdgeInsets.symmetric(vertical: 4.0),
                                          child:
                                          Column(
                                            children: [
                                              Text(
                                                "\$ ${data.amount}",
                                                style: TextStyle(
                                                  color: AppColor.customYellow,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 12,
                                                ),
                                              ),
                                              Card(
                                                child: Row(
                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                  children: [
                                                    Text(
                                                      data.cat!,
                                                      style: TextStyle(
                                                        color: Colors.green,
                                                        fontWeight: FontWeight.w500,
                                                        fontSize: 10,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        )),
                                    SizedBox(width: 10),
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Container(
                                          height: 30,
                                          width: size.width *.5,
                                          child: Text(

                                            data.transName!,
                                            maxLines: 2,
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.w600,
                                              fontSize: 10,
                                            ),
                                          ),
                                        ),
                                        Text(
                                          data.project!,
                                          style: TextStyle(
                                            color: Colors.blue,
                                            fontWeight: FontWeight.normal,
                                            fontSize: 10,
                                          ),
                                        ),
                                        Container(
                                          height: 30,
                                          width: size.width *.5,
                                          child: Text(

                                            data.des!,
                                            maxLines: 2,
                                            style: TextStyle(
                                              color: Colors.white60,
                                              fontWeight: FontWeight.w600,
                                              fontSize: 10,
                                            ),
                                          ),
                                        ),

                                        Container(
                                          width: MediaQuery.of(context).size.width *.44,
                                          child: Text(
                                            maxLines: 3,

                                            data.user!,
                                            style: TextStyle(
                                              color: Colors.cyanAccent,
                                              fontWeight: FontWeight.normal,
                                              fontSize: 10,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Spacer(),
                                    Container(
                                        height: 62,
                                        decoration: BoxDecoration(color: AppColor.backgroundColor.withOpacity(.3), borderRadius: BorderRadius.circular(6)),
                                        width: 70,
                                        child: Padding(
                                          padding:
                                          const EdgeInsets.symmetric(vertical: 4.0),
                                          child:
                                          Column(
                                            children: [
                                              Row(
                                                mainAxisAlignment: MainAxisAlignment.center,
                                                children: [
                                                  Text(
                                                    DateFormat('EEEE').format(DateTime.now()).toString().substring(0, 3) + ",",
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
                                                  ),
                                                  SizedBox(
                                                    height: 2,
                                                  ),
                                                  //"LogTimeIn":"2022-09-13T08:36:40.32"
                                                  Center(
                                                    child: Text(
                                                      " " + DateTime.now().toString().substring(8, 10),
                                                      style: TextStyle(fontSize: 10, fontWeight: FontWeight.normal),
                                                      textAlign: TextAlign.center,
                                                    ),
                                                  ),
                                                  Text(DateFormat('MMM').format(DateTime.now()).toString().substring(0, 3), style: TextStyle(fontSize: 10, fontWeight: FontWeight.normal),),
                                                ],
                                              ),
                                              Card(
                                                child: Row(
                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                  children: [
                                                    Text(
                                                      DateFormat.jm().format(DateTime.now()), style: TextStyle(fontSize: 11, fontWeight: FontWeight.normal),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        )),

                                  ],
                                ),
                              );
                            }),
                      ),
                    )

                  ],
                ),
              ));
        }
    );
  }


}

