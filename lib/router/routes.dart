import 'package:get/get.dart';

import '../src/enter/home/binding.dart';
import '../src/enter/home/view.dart';
import '../src/enter/upgrade_info/binding.dart';
import '../src/enter/upgrade_info/view.dart';
import '../src/enter/upgrade_setting/binding.dart';
import '../src/enter/upgrade_setting/view.dart';

///
/// @desc ''
/// @author karl_wei
/// @date 2022/5/29 15:58
///
class RouteConfig {
  static const String home = "/enter/homePage";
  static const String upgradeSetting = "/enter/upgradeSettingPage";
  static const String upgradeInfo = "/enter/upgradeInfoPage";

  static final List<GetPage> getPages = [
    GetPage(
      name: home,
      page: () => HomePage(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: upgradeSetting,
      page: () => UpgradeSettingPage(),
      binding: UpgradeSettingBinding(),
    ),
    GetPage(
      name: upgradeInfo,
      page: () => UpgradeInfoPage(),
      binding: UpgradeInfoBinding(),
    ),
  ];
}
