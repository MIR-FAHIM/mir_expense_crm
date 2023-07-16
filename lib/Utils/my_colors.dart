import 'package:flutter/material.dart';

class MyColors {
  static Color? primary = Colors.grey[900]; //Color(0xFF1976D2);
  static Color? primaryDark = Colors.grey[900]; //Color(0xFF1565C0);
  static Color? primaryLight = Colors.grey[900]; //Color(0xFF1E88E5);
  static const Color primaryVeryLight = Color(0xFFD5E4F1);
  static const Color accent = Color(0xfff7892b);
  static const Color accentDark = Color(0xfff7892b);
  static const Color accentLight = Color(0xfff7892b);
  static const Color lightBlue = Color(0x00000007);
  static const Color darkBlue = Color(0x00000008);
  static const Color customBlue = Color(0xFF26E5FF);
  static const Color customYellow = Color(0xFFFFCF26);
  static const double kPadding = 10.0;
  static const Color purpleLight = Color(0XFF1e224c);
  static const Color purpleDark = Color(0XFF0d193e);
  static const Color orange = Color(0XFFec8d2f);
  static const Color red = Color(0XFFf44336);
  static  Color shadeBlue =HexColor("#ebf9ff");
  static  Color appColor =HexColor("#77CBD2");
  static  Color brown =HexColor("#FBCD59");
  static  Color brownLight =HexColor("#FCE0A2");
  static  Color grey01 =HexColor("#b8b8b8");
  static  Color appBlue =HexColor("#009ee5");
  static  Color shadeBlack =HexColor("#484848");
  static  Color lightgreen =HexColor("#D5FCEB");
  static  Color lightwhite =HexColor("#f8f9fd");
  static  Color greenLight =HexColor("#54c492");
  static  Color paste =HexColor("#99FEFF");
  static  Color pinkHex =HexColor("#9E4784");
  static  Color darkOrrange =HexColor("#D27685");
  static  Color greenPaste =HexColor("#D5FCEB");
  static  Color deepBlue =HexColor("#3866BB");
  static const Color grey_3 = Color(0xFFf7f7f7);
  static const Color grey_5 = Color(0xFFf2f2f2);
  static const Color grey_10 = Color(0xFFe6e6e6);
  static const Color grey_20 = Color(0xFFcccccc);
  static const Color grey_40 = Color(0xFF999999);
  static const Color grey_60 = Color(0xFF666666);
  static const Color grey_80 = Color(0xFF37474F);
  static const Color grey_90 = Color(0xFF263238);
  static const Color grey_95 = Color(0xff1a1a1a);
  static const Color grey_100_ = Color(0xFF0d0d0d);

  // customcolor

  static  Color customRed =HexColor("#EE3E54");


}
class HexColor extends Color {
  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF$hexColor";
    }
    return int.parse(hexColor, radix: 16);
  }

  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));
}