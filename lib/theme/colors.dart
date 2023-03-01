import 'package:flutter/material.dart';

class AppColors {
  static const link = Color(0xff130f26);
  static const error = Color(0xffe61f10);
  static const primary = Color.fromARGB(255, 67, 187, 77);
  static const secondaryColor = Color(0xff82c1e1);

  static const dark = Color(0xff1a1a1a);
  static const light = Color(0xffe6e6e6);

  static const card = Color(0xff84949b);
  static const divider = Color(0xffE0E0E0);

  static const text = Color(0xff6c7b82);

  static const white = Color(0xffffffff);
  static const black = Color(0xff1C1C1C);
}

extension TextColor on ThemeData {
  Color get secondaryText {
    return AppColors.text;
  }

  Color get secondaryColor {
    return AppColors.secondaryColor;
  }

  Color get onPrimaryColor => AppColors.white;
}
