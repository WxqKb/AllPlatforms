///
/// @desc ''
/// @author karl_wei
/// @date 2022/5/30 18:15
///
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:window_manager/window_manager.dart';

import '../config/asset_name.dart';

class CommonAppBar {
  static globalAppBar(BuildContext context,
      {String? title,
      bool needLeading = true,
      List<Widget> actions = const [],
      SystemUiOverlayStyle? systemOverlayStyle,
      bottom,
      double height = 64}) {
    return AppBar(
      foregroundColor: Colors.white,
      backgroundColor: Colors.white,
      bottom: bottom,
      toolbarHeight: height.h,
      centerTitle: true,
      elevation: 0.5,
      leading: needLeading
          ? Center(
              child: GestureDetector(
                onTap: () => Navigator.pop(context),
                child: Image.asset(AssetNames.icArrowBack,
                    fit: BoxFit.contain, width: 28.w),
              ),
            )
          : null,
      title: title == null
          ? null
          : Text(
              title,
              style: TextStyle(
                fontSize: 24.sp,
                color: const Color(0xFF333333),
              ),
            ),
      actions: [
        ...actions,
        Center(
          child: GestureDetector(
            onTap: () {
              windowManager.hide();
            },
            child: Image.asset(
              AssetNames.icClose,
              fit: BoxFit.cover,
              width: 32.w,
              height: 32.w,
            ),
          ),
        ),
        SizedBox(width: 16.w),
      ],
    );
  }
}
