
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:mir_expense_tracker/Utils/app_colors/app_color.dart';
import 'package:mir_expense_tracker/screens/splash/controller/splash_controller.dart';

import '../../../Utils/utils_get/ui_support.dart';




class SplashscreenView extends GetView<SplashscreenController> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    Get.find<SplashscreenController>();
    return Scaffold(
      backgroundColor: AppColor.backgroundColor,
      body: SizedBox(
        height: size.height,
        width: size.width,
        child: Stack(
          children: [
            // height: size.width * .35,
            // width: size.width * .35,
            Center(
              child: SizedBox(
                height: size.width * .35,
                width: size.width * .35,
                child: Image.asset("assets/icons/Icons/belluser.png"),
              ),
            ),

            // Image(
            //   height: 200,
            //   width: 200,
            //   image: AssetImage(
            //     'assets/Logow.png',
            //   ),
            // ),

            Positioned(
              bottom: 10,
              right: 0,
              left: 0,
              child: UiSupport.customLoaderSplash(),
            )
          ],
        ),
      ),
    );
  }
}
