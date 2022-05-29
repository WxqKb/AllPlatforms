///
/// @desc ''
/// @author karl_wei
/// @date 2022/5/29 15:58
///

import 'package:intl/intl.dart';

class CommonUtils {
  static String formatDateTime(DateTime date,
      {String format = "yyyy-MM-dd hh:mm:ss"}) {
    return DateFormat(format, 'zh').format(date);
  }
}
