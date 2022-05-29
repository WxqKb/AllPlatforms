///
/// @desc ''
/// @author karl_wei
/// @date 2022/5/29 15:58
///

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Toast {
  static void showToast(String text, {int? timeInSeconds}) {
    cancelToast();
    Fluttertoast.showToast(
      msg: text,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: timeInSeconds ?? 3,
      backgroundColor: const Color(0xff323334),
      textColor: Colors.white,
      fontSize: 16,
    );
  }

  static void cancelToast() {
    Fluttertoast.cancel();
  }
}
