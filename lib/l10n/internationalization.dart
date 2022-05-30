import 'package:get/get_navigation/src/root/internacionalization.dart';

///
/// @desc ''
/// @author karl_wei
/// @date 2022/5/30 15:29
///

class Internationalization extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'en_US': {
          'hello': 'Hello World',
          'appName': 'Flutter Demo',
        },
        'zh': {
          'hello': '你好，世界',
          'appName': 'Flutter 演示',
        }
      };
}
