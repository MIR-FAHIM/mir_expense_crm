import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mir_expense_tracker/Utils/app_colors/app_color.dart';
import 'package:mir_expense_tracker/Utils/my_colors.dart';
import 'package:mir_expense_tracker/screens/auth/controller/auth_controller.dart';






class LoginView extends GetView<AuthController> {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyColors.purpleLight,
        title: Text("Sign In Now",style: TextStyle(color: MyColors.appBlue),),
        centerTitle: true,


      ),
      body: Obx(
              () {
            return Column(
              children: [
                SizedBox(height: 20,),
                Container(
                  alignment: Alignment.center,
                  // color: AppColor.backgroundColor,
                  child: SvgPicture.asset(
                    "assets/icons/drop_box.svg",
                    height: 30,
                    width: 30,
                  ),
                ),
                SizedBox(height: 20,),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Container(
                    child: Column(
                      children: <Widget>[
                        TextFormField(
                          maxLines: 1,
                          controller: controller.mobileController.value,
                          decoration: new InputDecoration(
                            labelText: 'Mobile',
                            suffixIcon: Icon(
                              Icons.email_outlined,
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(10.0),
                              ),
                            ),
                          ),
                          validator: (value) {
                            if (value!.trim().isEmpty)
                              return "Mobile is Required";
                            else if (!GetUtils.isEmail(value.trim()))
                              return "Please enter valid No";
                            else
                              return null;
                          },
                        ),
                        SizedBox(height: 20),
                        TextFormField(
                          maxLines: 1,
                          controller: controller.passController.value,
                          decoration: new InputDecoration(
                            labelText: 'Password',
                            suffixIcon: Icon(
                              Icons.lock_outline,
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(10.0),
                              ),
                            ),
                          ),
                          obscureText: true,
                          validator: (value) {
                            if (value!.trim().isEmpty) {
                              return "Password is Required";
                            }
                          },
                        ),
                        SizedBox(
                          height: 25,
                        ),
                      ],
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    //controller.visible.value++;
                    controller.doesMobileAlreadyExist(controller.mobileController.value.text, controller.passController.value.text);
                  },
                  child: AnimatedContainer(
                    duration: Duration(seconds: 2),
                    height: controller.visible.value == 1 ? 50 : 60,
                    width: controller.visible.value == 1 ? 50 : 140,
                    decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius:
                        BorderRadius.circular(controller.visible.value == 1 ? 60 : 10)),
                    alignment: Alignment.center,
                    child: controller.visible.value == 1
                        ? Center(child: CircularProgressIndicator())
                        : Text(
                      "Sign In",
                      style: TextStyle(
                        color: AppColor.backgroundColor,
                        fontSize: 12,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 25,
                ),
                Text("Forgot Password?"),
                Spacer(),
                Container(
                    height: 30,
                    width: Get.width,
                    color: MyColors.purpleLight,
                    child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Do not have an account?", style: TextStyle(color: MyColors.appBlue),),
                            GestureDetector(
                                onTap: (){
                                //  Get.to(RegistrationView());
                                },
                                child: Text("Create Account", style: TextStyle(color: MyColors.customBlue, fontSize: 15),)),
                          ],
                        )))

              ],
            );
          }
      ),
    );
  }
}

