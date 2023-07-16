import 'dart:convert';


import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import 'package:http/http.dart' as http;
import 'package:mir_expense_tracker/Utils/my_colors.dart';
import 'package:mir_expense_tracker/screens/dashboard/view/components/header.dart';
import 'package:mir_expense_tracker/screens/dashboard/view/components/recent_files.dart';



class OrganizationProspect extends StatefulWidget {
  const OrganizationProspect({Key? key}) : super(key: key);

  @override
  State<OrganizationProspect> createState() => _IndividualProspectState();
}

class _IndividualProspectState extends State<OrganizationProspect> {


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery
        .of(context)
        .size;
    return Scaffold(
      bottomNavigationBar: Container(
        height: 55,
        // color: primaryColorLight,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 5.0),
          child: InkWell(
            onTap: () {
              // Get.to(CreateProspectFront());
            },
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6),
                  color: MyColors.customBlue),
              child: const Center(
                child: Padding(
                  padding: EdgeInsets.all(5.0),
                  child: Text(
                    'Create Prospect',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [

            RecentFiles(),
          ],
        ),
      ),
    );
  }
}

