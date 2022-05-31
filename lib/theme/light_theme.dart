///
/// @desc ''
/// @author karl_wei
/// @date 2022/5/29 15:58
///

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

final ThemeData lightTheme = ThemeData(
  primaryColor: Colors.white,
  scaffoldBackgroundColor: const Color(0xFFF4F4F4),
  dividerColor: const Color(0xFFE8E8E8),
  textTheme: TextTheme(
    headline1: TextStyle(
      fontSize: 24.sp,
      fontWeight: FontWeight.bold,
      color: const Color(0xFF333333),
    ),
    headline2: TextStyle(
      fontSize: 24.sp,
      fontWeight: FontWeight.normal,
      color: const Color(0xFF333333),
    ),
    bodyText1: TextStyle(
      fontSize: 24.sp,
      fontWeight: FontWeight.bold,
      color: const Color(0xFF333333),
    ),
    bodyText2: TextStyle(
      fontSize: 24.sp,
      color: const Color(0xFF333333),
    ),
    subtitle1: TextStyle(
      fontSize: 16.sp,
      color: const Color(0xFF666666),
    ),
    subtitle2: TextStyle(
      fontSize: 10.sp,
      color: const Color(0xFF999999),
    ),
  ),
);
