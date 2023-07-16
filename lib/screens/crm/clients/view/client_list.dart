import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mir_expense_tracker/Utils/app_colors/app_color.dart';
import 'package:mir_expense_tracker/constants.dart';
import 'package:mir_expense_tracker/routes/app_pages.dart';
import 'package:mir_expense_tracker/screens/auth/controller/auth_controller.dart';
import 'package:mir_expense_tracker/screens/crm/clients/controller/clients_controller.dart';
import 'package:mir_expense_tracker/screens/dashboard/view/components/header.dart';
import 'package:mir_expense_tracker/screens/A_main/components/side_menu.dart';
import 'package:mir_expense_tracker/screens/A_main/controller/home_main_controller.dart';
import 'package:mir_expense_tracker/controllers/MenuAppController.dart';
import 'package:mir_expense_tracker/responsive.dart';
import 'package:mir_expense_tracker/screens/dashboard/view/dashboard_screen.dart';
import 'package:intl/intl.dart';
import 'package:mir_expense_tracker/screens/project/controller/project_controller.dart';
import 'package:provider/provider.dart';
import 'package:expandable/expandable.dart';


class ClientList extends GetView<ClientController> {
  const ClientList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

      return Scaffold(
          key: context.read<MenuAppController>().scaffoldKeyClient,
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              Get.toNamed(Routes.ADDCLIENT);
            },
            child: Center(
              child: Icon(Icons.add),
            ),
          ),
          drawer: SideMenu(),
          body: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 10,
                ),
                Header(
                  headerTitle: "ClientList",
                ),
                SizedBox(height: defaultPadding),
                Center(
                  child: Text("Client List"),
                ),
                SizedBox(
                  height: size.height,
                  width: size.width,
                  child: ListView.builder(
                      itemCount: 5,
                      itemBuilder: (BuildContext con, index) {
                       // var data = controller.projectList[index];
                        return ExpandableNotifier(
                          child: Stack(
                            children: [
                              Card(
                                color: AppColor.secondaryColor.withOpacity(.5),
                                shape:
                                RoundedRectangleBorder(
                                    side: BorderSide(
                                      width: 02,
                                      color:  Colors.orange,
                                    ),
                                    borderRadius:
                                    BorderRadius
                                        .circular(
                                        6)),
                                child: Padding(
                                  padding:
                                  const EdgeInsets
                                      .symmetric(
                                      horizontal:
                                      10.0,
                                      vertical: 8),
                                  child: Column(
                                    crossAxisAlignment:
                                    CrossAxisAlignment
                                        .start,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                        MainAxisAlignment
                                            .spaceBetween,
                                        children: [
                                          Text(
                                            "Client Id: ",
                                            style: TextStyle(
                                                color:
                                                primaryColor,
                                                fontWeight:
                                                FontWeight
                                                    .bold,
                                                fontSize:
                                                12),
                                          ),
                                          Text(
                                            DateFormat
                                                .yMd()
                                                .format(DateTime.now()),
                                            style: TextStyle(
                                                color: Colors
                                                    .grey),
                                          )
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        controller.dropDownValue11.value,
                                        style: TextStyle(
                                            fontWeight:
                                            FontWeight
                                                .w600),
                                      ),
                                     Text(
                                        "Ibne Sina Hospital",
                                        style: TextStyle(
                                            fontWeight:
                                            FontWeight
                                                .w600,
                                            color: Colors
                                                .white,
                                            fontSize:
                                            12),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        "Ibn sina hospital made a deal with onetap health for health service in 23 march 2023. We are looking forward to have great journey together",
                                        style: TextStyle(
                                            color: Colors
                                                .grey,
                                            fontSize: 14),
                                      ),
                                      const SizedBox(
                                        height: 30,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                        MainAxisAlignment
                                            .spaceBetween,
                                        children: [
                                          GestureDetector(
                                            onTap: () {

                                            },
                                            child: Container(
                                                height: 62,
                                                decoration: BoxDecoration(color: AppColor.backgroundColor.withOpacity(.3), borderRadius: BorderRadius.circular(6)),
                                                width: 100,
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
                                                            style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                                                          ),
                                                          SizedBox(
                                                            height: 5,
                                                          ),
                                                          //"LogTimeIn":"2022-09-13T08:36:40.32"
                                                          Center(
                                                            child: Text(
                                                              " " + DateTime.now().toString().substring(8, 10),
                                                              textAlign: TextAlign.center,
                                                            ),
                                                          ),
                                                          Text(DateFormat('MMM').format(DateTime.now()).toString().substring(0, 3)),
                                                        ],
                                                      ),
                                                      Card(
                                                        child: Row(
                                                          mainAxisAlignment: MainAxisAlignment.center,
                                                          children: [
                                                            Text(
                                                              DateFormat.jm().format(DateTime.now()),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                )),
                                          ),
                                          Spacer(),
                                          Text(
                                            "${DateTime.now().difference(DateTime.now()).inDays} days",
                                            style: TextStyle(
                                                color: Colors
                                                    .grey,
                                                fontSize:
                                                12),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 15,
                                      ),
                                      Card(
                                        elevation:
                                        5,
                                        color:  AppColor.appColor,
                                        child:
                                        Container(
                                          child:
                                          Column(
                                            crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                            children: [
                                              Row(
                                                mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                                children: [
                                                  Row(
                                                    children: [
                                                      Text(
                                                        "Client: ",
                                                        style: TextStyle(fontSize: 12, color: AppColor.customYellow, fontWeight: FontWeight.bold),
                                                      ),
                                                      Container(
                                                        width: MediaQuery.of(context).size.width / 2.5,
                                                        child: Text(
                                                          "Ibn Sina",
                                                          style: TextStyle(fontSize: 12, color: Colors.white, fontWeight: FontWeight.normal),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  Row(
                                                    children: [
                                                      Text(
                                                        "Project:",
                                                        style: TextStyle(fontSize: 12, color: AppColor.customYellow, fontWeight: FontWeight.bold),
                                                      ),
                                                      Container(
                                                        width: MediaQuery.of(context).size.width / 4.1,
                                                        child:  Text(
                                                          "Project 1",
                                                          style: TextStyle(fontSize: 12, color: Colors.white, fontWeight: FontWeight.normal),
                                                        )

                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                              SizedBox(
                                                height:
                                                10,
                                              ),
                                               Container(
                                                  child: Column(
                                                    children: [
                                                      Container(
                                                        height: 20,
                                                        color: primaryColor,
                                                        child: Row(
                                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                          children: [
                                                            Container(
                                                              width: MediaQuery.of(context).size.width / 4,
                                                              child: Text(
                                                                "Contact person",
                                                                style: TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.bold),
                                                              ),
                                                            ),
                                                            Container(
                                                              width: MediaQuery.of(context).size.width / 4,
                                                              child: Text(
                                                                "Designation",
                                                                style: TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.bold),
                                                              ),
                                                            ),
                                                            Container(
                                                              width: MediaQuery.of(context).size.width / 4,
                                                              child: Text(
                                                                "Mobile",
                                                                style: TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.bold),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ],
                                                  )),
                                              Container(
                                                height:
                                                80,
                                                child: ListView.builder(
                                                    itemCount: 2,
                                                    itemBuilder: (BuildContext context, int index) {
                                                      return Container(
                                                        height: 40,
                                                        color: AppColor.secondaryColor,
                                                        child: Row(
                                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                          children: [
                                                          Container(
                                                              width: MediaQuery.of(context).size.width / 4,
                                                              child: Text(
                                                                "Mr Rahman",
                                                                style: TextStyle(color: Colors.grey, fontSize: 12),
                                                              ),
                                                            ),

                                                   Container(
                                                              width: MediaQuery.of(context).size.width / 3.5,
                                                              child: Text(
                                                                "Senior Manager",
                                                                style: TextStyle(
                                                                  color: Colors.grey,
                                                                  fontSize: 12,
                                                                ),
                                                              ),
                                                            ),
                                                   Container(
                                                              width: MediaQuery.of(context).size.width / 4,
                                                              child: Text(
                                                                "017673638473",
                                                                style: TextStyle(
                                                                  color: Colors.grey,
                                                                  fontSize: 12,
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      );
                                                    }),
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Row(
                                        children: [
                                          Container(
                                            decoration:
                                            BoxDecoration(
                                              color:Colors.purple.withOpacity(.5),
                                              borderRadius: const BorderRadius
                                                  .only(
                                                  topLeft:
                                                  Radius.circular(
                                                      30),
                                                  topRight:
                                                  Radius.circular(
                                                      30),
                                                  bottomLeft:
                                                  Radius.circular(
                                                      30),
                                                  bottomRight:
                                                  Radius.circular(30)),
                                            ),
                                            child:
                                            Padding(
                                              padding: const EdgeInsets
                                                  .symmetric(
                                                  horizontal:
                                                  8.0,
                                                  vertical:
                                                  3),
                                              child: Row(
                                                children: [
                                                  Icon(
                                                    Icons
                                                        .map,
                                                    color:
                                                    Colors.white,
                                                  ),
                                                  SizedBox(
                                                    width:
                                                    5,
                                                  ),
                                                  Text(
                                                    "Verified",
                                                    style:
                                                    TextStyle(color: Colors.white),
                                                  )
                                                ],
                                              ),
                                            ),
                                          ),
                                          Spacer(),



                                        ],
                                      ),
                                      const SizedBox(
                                        height: 05,
                                      ),
                                      ScrollOnExpand(
                                        scrollOnExpand:
                                        true,
                                        scrollOnCollapse:
                                        false,
                                        child:
                                        ExpandablePanel(
                                          theme:
                                          const ExpandableThemeData(
                                            iconColor:Colors.white,
                                            headerAlignment:
                                            ExpandablePanelHeaderAlignment
                                                .center,
                                            tapBodyToCollapse:
                                            true,
                                          ),
                                          header: Row(
                                            children: [
                                              const Text(
                                                'Pick Any',
                                                style: TextStyle(
                                                    color: Colors
                                                        .white,
                                                    fontSize:
                                                    14,
                                                    fontWeight:
                                                    FontWeight.w600),
                                              ),
                                              SizedBox(
                                                width: 10,
                                              ),
                                              InkWell(
                                                splashColor:
                                                Colors
                                                    .blue,
                                                onTap:
                                                    () {
                                                  controller.textMe(
                                                      455);
                                                },
                                                child:
                                                Card(
                                                  shape: RoundedRectangleBorder(
                                                      borderRadius:
                                                      BorderRadius.circular(100)),
                                                  child:
                                                  Container(
                                                    decoration:
                                                    BoxDecoration(shape: BoxShape.circle),
                                                    child:
                                                    Padding(
                                                      padding:
                                                      const EdgeInsets.all(8.0),
                                                      child:
                                                      Icon(
                                                        Icons.chat,
                                                        color: primaryColor,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              SizedBox(
                                                width: 5,
                                              ),
                                              InkWell(
                                                splashColor:
                                                Colors
                                                    .blue,
                                                onTap:
                                                    () {
                                                  controller.launchPhoneDialer(
                                                      "2424");
                                                },
                                                child:
                                                Card(
                                                  shape: RoundedRectangleBorder(
                                                      borderRadius:
                                                      BorderRadius.circular(100)),
                                                  child:
                                                  Container(
                                                    decoration:
                                                    BoxDecoration(shape: BoxShape.circle),
                                                    child:
                                                    Padding(
                                                      padding:
                                                      const EdgeInsets.all(8.0),
                                                      child:
                                                      Icon(
                                                        Icons.call,
                                                        color: primaryColor,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              SizedBox(
                                                width: 5,
                                              ),
                                              InkWell(
                                                splashColor:
                                                Colors
                                                    .blue,
                                                onTap:
                                                    () {
                                                  controller.launchWhatsapp(
                                                      356.toString());
                                                },
                                                child:
                                                Card(
                                                  shape: RoundedRectangleBorder(
                                                      borderRadius:
                                                      BorderRadius.circular(100)),
                                                  child:
                                                  Container(
                                                    decoration:
                                                    BoxDecoration(shape: BoxShape.circle),
                                                    child:
                                                    Padding(
                                                      padding:
                                                      const EdgeInsets.all(8.0),
                                                      child:
                                                      Icon(
                                                        Icons.messenger,
                                                        color: primaryColor,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              SizedBox(
                                                width: 5,
                                              ),
                                              Card(
                                                shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                    BorderRadius.circular(100)),
                                                child:
                                                Container(
                                                  decoration:
                                                  BoxDecoration(shape: BoxShape.circle),
                                                  child:
                                                  Padding(
                                                    padding:
                                                    const EdgeInsets.all(8.0),
                                                    child:
                                                    Icon(
                                                      Icons.more_horiz,
                                                      color:
                                                      primaryColor,
                                                    ),
                                                  ),
                                                ),
                                              )
                                            ],
                                          ),
                                          collapsed:
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          expanded:
                                          Column(
                                            children: [
                                              const SizedBox(
                                                height:
                                                20,
                                              ),
                                              const SizedBox(
                                                height:
                                                10,
                                              ),
                                              Row(
                                                children: [
                                                  Icon(
                                                    Icons
                                                        .send,
                                                    color:
                                                    Colors.grey,
                                                  ),
                                                  SizedBox(
                                                    width:
                                                    10,
                                                  ),
                                                  Container(
                                                    decoration:
                                                    const BoxDecoration(shape: BoxShape.circle),
                                                    child:
                                                    const CircleAvatar(
                                                      radius:
                                                      12,
                                                      backgroundImage:
                                                      AssetImage(
                                                        'assets/images/profile_pic.png',
                                                      ),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    width:
                                                    5,
                                                  ),
                                                  Text(
                                                    "Lubna Yeasmin",
                                                    style: TextStyle(color: Colors.grey, fontSize: 14),
                                                  )
                                                ],
                                              ),
                                              Row(
                                                children: [
                                                  Icon(
                                                    Icons
                                                        .airline_seat_recline_normal_sharp,
                                                    color:
                                                    Colors.grey,
                                                  ),
                                                  SizedBox(
                                                    width:
                                                    10,
                                                  ),
                                                  Container(
                                                    decoration:
                                                    const BoxDecoration(shape: BoxShape.circle),
                                                    child:
                                                    const CircleAvatar(
                                                      radius:
                                                      12,
                                                      backgroundImage:
                                                      AssetImage(
                                                        'assets/images/profile_pic.png',
                                                      ),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    width:
                                                    5,
                                                  ),
                                              Text(
                                                    "No Data",
                                                    style: TextStyle(color: Colors.grey, fontSize: 14),
                                                  )

                                                ],
                                              ),
                                              const SizedBox(
                                                height:
                                                10,
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                MainAxisAlignment
                                                    .spaceBetween,
                                                children: [
                                                  Row(
                                                    children: [
                                                      const Text(
                                                        'Action',
                                                        style: TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.w600),
                                                      ),
                                                      SizedBox(
                                                        width: 10,
                                                      ),
                                                      Card(
                                                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
                                                        child: Container(
                                                          decoration: BoxDecoration(shape: BoxShape.circle),
                                                          child: Padding(
                                                            padding: const EdgeInsets.all(8.0),
                                                            child: Icon(
                                                              Icons.edit,
                                                              color: primaryColor,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        width: 5,
                                                      ),
                                                      Card(
                                                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
                                                        child: Container(
                                                          decoration: BoxDecoration(shape: BoxShape.circle),
                                                          child: Padding(
                                                            padding: const EdgeInsets.all(8.0),
                                                            child: Icon(
                                                              Icons.delete,
                                                              color: Colors.red,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        width: 110,
                                                      ),
                                                   Container(
                                                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(6), color: Colors.redAccent),
                                                        child: Padding(
                                                          padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 8),
                                                          child: Text(
                                                            "Active",
                                                            style: TextStyle(color: Colors.white, fontSize: 12),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                        );
                      }),
                )
              ],
            ),
          ));

  }
}
