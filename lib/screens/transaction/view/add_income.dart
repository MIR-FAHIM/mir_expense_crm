import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mir_expense_tracker/Utils/app_colors/app_color.dart';
import 'package:mir_expense_tracker/Widget/custom_text_field.dart';
import 'package:mir_expense_tracker/constants.dart';
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

import '../../../routes/app_pages.dart';







class AddIncomeView extends GetView<TransactionController> {
  const AddIncomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
        key: context.read<MenuAppController>().scaffoldKeyAddIncome,
        body: Obx(
           () {
            return SingleChildScrollView(
              child: Container(
                width: size.width,
                height: size.height * 1.5,
                child: SafeArea(
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 30),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [


                        Text(
                          "Add Income Name",
                        ),
                        CustomTextInput(
                          textController: controller.transactionNameController.value,
                          hintText: "Income Title",
                          keybrdType: true,
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          "Amount",
                          // style: Get.theme.textTheme.bodySmall,
                        ),
                        CustomTextInput(
                          textController: controller.transAmountController.value,
                          hintText: "Amount",
                          keybrdType: false,
                        ),
                        SizedBox(
                          height: 20,
                        ),

                        Text("Description"),
                        CustomTextInput(
                          textController: controller.transactionDesController.value,
                          hintText: "Description",
                          keybrdType: true,

                        ),

                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          "Category",
                          // style: Get.theme.textTheme.bodySmall,


                        ),
                        Container(
                            decoration: BoxDecoration(
                                color: Colors.white,
                                border: Border.all(
                                    color: Colors.black12, width: 1),
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(10.0))),
                            child: Padding(
                              padding:
                              const EdgeInsets.only(left: 8, right: 8),
                              child: DropdownButton<String>(
                                isExpanded: true,
                                value: "1",
                                icon: Icon(Icons.arrow_drop_down_outlined),
                                elevation: 16,
                                style:
                                const TextStyle(color: Colors.deepPurple),
                                underline: Container(
                                  height: 2,
                                  color: Colors.transparent,
                                ),
                                onChanged: (String? value) {

                                  controller.selectCatIncome.value = value!;

                                },
                                items: ["1", "2", "3"].map((value) {
                                  return DropdownMenuItem<String>(
                                    value: value.toString(),
                                    child: Text(value.toString()),
                                  );
                                }).toList(),
                              ),
                            )),

                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          "Project(Optional)",
                          // style: Get.theme.textTheme.bodySmall,

                        ),
                        Container(
                            decoration: BoxDecoration(
                                color: Colors.white,
                                border: Border.all(
                                    color: Colors.black12, width: 1),
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(10.0))),
                            child: Padding(
                              padding:
                              const EdgeInsets.only(left: 8, right: 8),
                              child: DropdownButton<String>(
                                isExpanded: true,
                                value:   controller.selectProject.value,
                                icon: Icon(Icons.arrow_drop_down_outlined),
                                elevation: 16,
                                style:
                                const TextStyle(color: Colors.deepPurple),
                                underline: Container(
                                  height: 2,
                                  color: Colors.transparent,
                                ),
                                onChanged: (String? value) {

                                  controller.selectProject.value = value!;

                                },
                                items: controller.projectList.map((value) {
                                  return DropdownMenuItem<String>(
                                    value: value.projectName.toString(),
                                    child: Text(value.projectName.toString()),
                                  );
                                }).toList(),
                              ),
                            )),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(
                                  color: Colors.green, width: 1),
                              borderRadius: const BorderRadius.all(
                                  Radius.circular(10.0))),
                          child: TextFormField(
                            controller: controller.dateController.value,
                            readOnly: true,
                            onTap: () {
                              DatePicker.showDateTimePicker(context,
                                  showTitleActions: true,
                                  onChanged: (date) {
                                    print('change $date in time zone ' +
                                        date.timeZoneOffset.inHours
                                            .toString());
                                  }, onConfirm: (date) {
                                    String myDate = DateTime(
                                        date.year, date.month, date.day)
                                        .toString();
                                    String myTime = DateTime(
                                      date.hour,
                                      date.minute,
                                    ).toString();
                                    print(
                                        "my min and sec for due is $myTime");

                                    textController: controller.dateController.value.text =
                                        myDate.substring(0, 10);
                                    textController: controller.dateController.value.text =
                                        date.toString().substring(11, 16);
                                    print('confirm $date');
                                  }, currentTime: DateTime.now());
                            },
                            onChanged: (value) {
                              // _productController.searchProduct(value);
                            },
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              prefix: Container(
                                width: 20,
                              ),
                              hintText: 'Due Date',
                              suffixIcon: Icon(
                                Icons.date_range_rounded,
                                color: Color(0xFF7C8DB5),
                                size: 14,
                              ),
                              hintStyle: TextStyle(
                                  fontSize: 12.0,
                                  fontFamily: 'Roboto',
                                  color: Colors.green),
                              border: InputBorder.none,
                            ),
                          ),
                        ),

                        SizedBox(
                          height: 20,
                        ),
                        GestureDetector(
                          onTap: (){
                            controller.addIncomeController().then((e){
                              controller.incomeList.clear();
                              controller.expenseList.clear();
                              controller.transactionList.clear();
                              controller.retrieveTransaction().then((value) {

                                return controller.transactionList.value = value;
                              } ).then((value) {
                                for (var element in controller.transactionList.where((e) => e.type == "income")) {
                                  controller.incomeList.add(element.amount!);
                                  controller.totalIncome.value = controller.incomeList.reduce((a, b) => a + b);
                                }

                                for (var element in controller.transactionList.where((e) => e.type == "expense")) {
                                  controller.expenseList.add(element.amount!);
                                  controller.totalExpense.value = controller.expenseList.reduce((a, b) => a + b);
                                }
                                Get.toNamed(Routes.INCOMELIST);
                              });

                            });

                          },
                          child: Container(
                            height: 60,
                            width: MediaQuery.of(context).size.width ,
                            decoration: BoxDecoration(
                                color: Colors.green,
                                borderRadius: BorderRadius.circular(6),
                                border: Border.all(
                                    color: Colors.grey.withOpacity(.35))),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Center(
                                child:  Text(
                                  'Add Income',
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ),
                          ),
                        ),

                      ],
                    ),
                  ),
                ),
              ),
            );
          }
        )
    );
  }
}

