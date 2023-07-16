import 'package:flutter/material.dart';
import 'package:mir_expense_tracker/Utils/utils_get/app_colors/app_colors.dart';


class CustomTextInput extends StatelessWidget {
  const CustomTextInput({
    TextEditingController? textController,
    String? hintText,
    bool? keybrdType,
    EdgeInsets padding = const EdgeInsets.only(left: 40),
    Key? key,
  })  : _hintText = hintText,
        textEditingController = textController,
        _keybrdType = keybrdType ,

        _padding = padding,
        super(key: key);

  final String? _hintText;
  final bool? _keybrdType;
  final EdgeInsets? _padding;
  final TextEditingController? textEditingController;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 50,
      decoration: ShapeDecoration(
        color: AppColor.textColorWhite,
        shape: StadiumBorder(),
      ),
      child: TextField(
        style: TextStyle(color: Colors.black),
        keyboardType: _keybrdType == true ? TextInputType.text : TextInputType.number,
        controller: textEditingController,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: _hintText,
          hintStyle: TextStyle(
            color: Colors.grey,
          ),
          contentPadding: _padding,
        ),
      ),
    );
  }
}
