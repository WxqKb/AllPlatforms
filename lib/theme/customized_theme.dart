///
/// @desc ''
/// @author karl_wei
/// @date 2022/5/29 15:58
///

import 'package:flutter/material.dart';

import 'customized_data_protocol.dart';

extension CustomizedTheme on ThemeData {
  Color get primaryBlackColor => brightness == Brightness.light
      ? LightThemeData().primaryBlackColor
      : DarkThemeData().primaryBlackColor;
}

class LightThemeData implements CustomizedThemeData {
  static final LightThemeData _lightTheme = LightThemeData._internal();

  LightThemeData._internal();

  factory LightThemeData() => _lightTheme;

  @override
  Color primaryBlackColor = const Color(0xFF262626);
}

class DarkThemeData implements CustomizedThemeData {
  static final DarkThemeData _darkTheme = DarkThemeData._internal();

  DarkThemeData._internal();

  factory DarkThemeData() => _darkTheme;

  @override
  Color primaryBlackColor = const Color(0xFF262626);
}
