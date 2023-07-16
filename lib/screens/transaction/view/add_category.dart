import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mir_expense_tracker/Utils/app_colors/app_color.dart';
import 'package:mir_expense_tracker/Widget/custom_text_field.dart';
import 'package:mir_expense_tracker/routes/app_pages.dart';

import 'package:mir_expense_tracker/screens/project/controller/project_controller.dart';
import 'package:mir_expense_tracker/screens/transaction/controller/transaction_controller.dart';
import 'package:provider/provider.dart';

class CategoryAddForm extends GetView<TransactionController> {
  const CategoryAddForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Category"),
        centerTitle: true,
      ),
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

                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GestureDetector(
                              onTap: () {
                                controller.catType.value = "Expense";
                              },
                              child: Container(
                                height: 50,
                                width: 100,
                                decoration: BoxDecoration(
                                    color: controller.catType.value == "Expense" ? Colors.green : Colors.grey,
                                    borderRadius: BorderRadius.circular(6),
                                    border:
                                    Border.all(color: Colors.grey.withOpacity(.35))),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Center(
                                    child: Text(
                                      'Expense',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                controller.catType.value = "Income";
                              },
                              child: Container(
                                height: 50,
                                width: 100,
                                decoration: BoxDecoration(
                                    color: controller.catType.value != "Expense" ? Colors.green : Colors.grey,
                                    borderRadius: BorderRadius.circular(6),
                                    border:
                                    Border.all(color: Colors.grey.withOpacity(.35))),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Center(
                                    child: Text(
                                      'Income',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          "Add Category Name",
                        ),
                        CustomTextInput(
                          textController: controller.catNameController.value,
                          hintText: "Expense Title",
                          keybrdType: true,
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text("Description"),
                        CustomTextInput(
                          textController: controller.catDesController.value,
                          hintText: "Description",
                          keybrdType: true,
                        ),
                        SizedBox(
                          height: 50,
                        ),
                        GestureDetector(
                          onTap: () {
                            controller.addCategoryController();
                            // controller.addProjectController().then((e){
                            //   //   Get.toNamed(Routes.PROJECTLIST);
                            // });
                          },
                          child: Container(
                            height: 60,
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                                color: Colors.green,
                                borderRadius: BorderRadius.circular(6),
                                border:
                                Border.all(color: Colors.grey.withOpacity(.35))),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Center(
                                child: Text(
                                  'Add Category',
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 30,),
                        Text("Category List"),
                        SizedBox(height: 10,),

                        Container(
                          height: size.height *.4,
                          child: ListView.builder(
                            itemCount: controller.catList.length,
                              itemBuilder: (BuildContext b , index){
                              var data = controller.catList[index];
                              return Card(
                                child: ListTile(

                                  title: Text(data.catName!),
                                  subtitle: Text(data.type!, style: TextStyle(color:data.type == "Expense" ? Colors.red  : Colors.green ),),
                                ),
                              );
                              }
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            );
          }
        ));
  }
}
