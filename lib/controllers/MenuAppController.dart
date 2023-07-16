import 'package:flutter/material.dart';

class MenuAppController extends ChangeNotifier {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final GlobalKey<ScaffoldState> _scaffoldKey2 = GlobalKey<ScaffoldState>();
  final GlobalKey<ScaffoldState> _scaffoldKey3 = GlobalKey<ScaffoldState>();
  final GlobalKey<ScaffoldState> _scaffoldKey4 = GlobalKey<ScaffoldState>();
  final GlobalKey<ScaffoldState> _scaffoldKey5 = GlobalKey<ScaffoldState>();
  final GlobalKey<ScaffoldState> _scaffoldKey6 = GlobalKey<ScaffoldState>();
  final GlobalKey<ScaffoldState> _scaffoldKey7 = GlobalKey<ScaffoldState>();
  final GlobalKey<ScaffoldState> _scaffoldKey8 = GlobalKey<ScaffoldState>();
  final GlobalKey<ScaffoldState> _scaffoldKey9 = GlobalKey<ScaffoldState>();
  final GlobalKey<ScaffoldState> _scaffoldKey10 = GlobalKey<ScaffoldState>();
  final GlobalKey<ScaffoldState> _scaffoldKeyclt = GlobalKey<ScaffoldState>();
  final GlobalKey<ScaffoldState> _scaffoldKeyTm = GlobalKey<ScaffoldState>();
  final GlobalKey<ScaffoldState> _scaffoldKeyPrs = GlobalKey<ScaffoldState>();
  final GlobalKey<ScaffoldState> _scaffoldKeyTask = GlobalKey<ScaffoldState>();
  final GlobalKey<ScaffoldState> _scaffoldKeyContact = GlobalKey<ScaffoldState>();
  final GlobalKey<ScaffoldState> _scaffoldKeyDonation = GlobalKey<ScaffoldState>();
  final GlobalKey<ScaffoldState> _scaffoldKeyExpenseList = GlobalKey<ScaffoldState>();
  final GlobalKey<ScaffoldState> _scaffoldKeyAddIncome = GlobalKey<ScaffoldState>();
  final GlobalKey<ScaffoldState> _scaffoldKeyAddExpense = GlobalKey<ScaffoldState>();
  final GlobalKey<ScaffoldState> _scaffoldKeyOrganizationProspect = GlobalKey<ScaffoldState>();
  final GlobalKey<ScaffoldState> _scaffoldKeyAddProspect = GlobalKey<ScaffoldState>();
  final GlobalKey<ScaffoldState> _scaffoldKeyAddTask = GlobalKey<ScaffoldState>();
  final GlobalKey<ScaffoldState> _scaffoldKeyTaskList = GlobalKey<ScaffoldState>();



  GlobalKey<ScaffoldState> get scaffoldKey => _scaffoldKey;
  GlobalKey<ScaffoldState> get scaffoldKey2 => _scaffoldKey2;
  GlobalKey<ScaffoldState> get scaffoldKey3 => _scaffoldKey3;
  GlobalKey<ScaffoldState> get scaffoldKey4 => _scaffoldKey4;
  GlobalKey<ScaffoldState> get scaffoldKeyClient => _scaffoldKeyclt;
  GlobalKey<ScaffoldState> get scaffoldKey5 => _scaffoldKey5;
  GlobalKey<ScaffoldState> get scaffoldKeyTrans => _scaffoldKey6;
  GlobalKey<ScaffoldState> get scaffoldKeyAddIncome => _scaffoldKeyAddIncome;
  GlobalKey<ScaffoldState> get scaffoldKeyAddExpense => _scaffoldKeyAddExpense;

  GlobalKey<ScaffoldState> get scaffoldKeyOrganizationProspect => _scaffoldKeyOrganizationProspect;
  GlobalKey<ScaffoldState> get scaffoldKeyAddProspect => _scaffoldKeyAddProspect;

  GlobalKey<ScaffoldState> get scaffoldKeyAtten => _scaffoldKey7;
  GlobalKey<ScaffoldState> get scaffoldKeyTm => _scaffoldKeyTm;
  GlobalKey<ScaffoldState> get scaffoldKeyPrs => _scaffoldKeyPrs;
  GlobalKey<ScaffoldState> get scaffoldKeyTask => _scaffoldKeyTask;
  GlobalKey<ScaffoldState> get scaffoldKeyContact => _scaffoldKeyContact;
  GlobalKey<ScaffoldState> get scaffoldKeyDonation => _scaffoldKeyDonation;
  GlobalKey<ScaffoldState> get scaffoldKeyExpenseList => _scaffoldKeyExpenseList;
  GlobalKey<ScaffoldState> get scaffoldKeyAddTask => _scaffoldKeyAddTask;
  GlobalKey<ScaffoldState> get scaffoldKeyTaskList => _scaffoldKeyTaskList;






  void controlMenu() {
    if (!_scaffoldKey.currentState!.isDrawerOpen) {
      _scaffoldKey.currentState!.openDrawer();
    }
  }
  void controlMenu2() {
    if (!_scaffoldKey2.currentState!.isDrawerOpen) {
      _scaffoldKey2.currentState!.openDrawer();
    }
  }
  void controlMenu3() {
    if (!_scaffoldKey3.currentState!.isDrawerOpen) {
      _scaffoldKey3.currentState!.openDrawer();
    }
  }
  void controlMenu4() {
    if (!_scaffoldKey4.currentState!.isDrawerOpen) {
      _scaffoldKey4.currentState!.openDrawer();
    }
  }
  void controlMenu5() {
    if (!_scaffoldKey5.currentState!.isDrawerOpen) {
      _scaffoldKey5.currentState!.openDrawer();
    }
  }
  void controlMenu6() {
    if (!_scaffoldKey6.currentState!.isDrawerOpen) {
      _scaffoldKey6.currentState!.openDrawer();
    }
  }
  void controlMenu7() {
    if (!_scaffoldKey7.currentState!.isDrawerOpen) {
      _scaffoldKey7.currentState!.openDrawer();
    }
  }
  void controlMenu8() {
    if (!_scaffoldKey8.currentState!.isDrawerOpen) {
      _scaffoldKey8.currentState!.openDrawer();
    }
  }  void controlMenu9() {
    if (!_scaffoldKey9.currentState!.isDrawerOpen) {
      _scaffoldKey9.currentState!.openDrawer();
    }
  }
  void controlMenu10() {
    if (!_scaffoldKey10.currentState!.isDrawerOpen) {
      _scaffoldKey10.currentState!.openDrawer();
    }
  }
  void controlMenuClt() {
    if (!_scaffoldKeyclt.currentState!.isDrawerOpen) {
      _scaffoldKeyclt.currentState!.openDrawer();
    }
  }
  void controlMenuTm() {
    if (!_scaffoldKeyTm.currentState!.isDrawerOpen) {
      _scaffoldKeyTm.currentState!.openDrawer();
    }
  }
  void controlMenuPrs() {
    if (!_scaffoldKeyPrs.currentState!.isDrawerOpen) {
      _scaffoldKeyPrs.currentState!.openDrawer();
    }
  }

  void controlMenuTask() {
    if (!_scaffoldKeyTask.currentState!.isDrawerOpen) {
      _scaffoldKeyTask.currentState!.openDrawer();
    }
  }

  void controlMenuContact() {
    if (!_scaffoldKeyContact.currentState!.isDrawerOpen) {
      _scaffoldKeyContact.currentState!.openDrawer();
    }
  }
  void controlMenuDonation() {
    if (!_scaffoldKeyDonation.currentState!.isDrawerOpen) {
      _scaffoldKeyDonation.currentState!.openDrawer();
    }
  }
  void controlMenuAddIncome() {
    if (!_scaffoldKeyAddIncome.currentState!.isDrawerOpen) {
      _scaffoldKeyAddIncome.currentState!.openDrawer();
    }
  }
  void controlMenuAddExpense() {
    if (!_scaffoldKeyAddExpense.currentState!.isDrawerOpen) {
      _scaffoldKeyAddExpense.currentState!.openDrawer();
    }
  }
  void controlMenuOrganizationProspect() {
    if (!_scaffoldKeyOrganizationProspect.currentState!.isDrawerOpen) {
      _scaffoldKeyOrganizationProspect.currentState!.openDrawer();
    }
  }
  void controlMenuAddProspect() {
    if (!_scaffoldKeyAddProspect.currentState!.isDrawerOpen) {
      _scaffoldKeyAddProspect.currentState!.openDrawer();
    }
  }
  void controlMenuAddTask() {
    if (!_scaffoldKeyAddTask.currentState!.isDrawerOpen) {
      _scaffoldKeyAddTask.currentState!.openDrawer();
    }
  }
  void controlMenuTaskList() {
    if (!_scaffoldKeyTaskList.currentState!.isDrawerOpen) {
      _scaffoldKeyTaskList.currentState!.openDrawer();
    }
  }
  void controlMenuExpenseList() {
    if (!_scaffoldKeyExpenseList.currentState!.isDrawerOpen) {
      _scaffoldKeyExpenseList.currentState!.openDrawer();
    }
  }



}
