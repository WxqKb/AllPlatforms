import 'package:get/get.dart';

import '../src/enter/home/binding.dart';
import '../src/enter/home/view.dart';
import '../src/enter/upgrade/binding.dart';
import '../src/enter/upgrade/view.dart';

///
/// @desc ''
/// @author karl_wei
/// @date 2022/5/29 15:58
///
class RouteConfig {
  static const String home = "/enter/homePage";
  static const String upgrade = "/enter/upgradePage";
  static final List<GetPage> getPages = [
    GetPage(
      name: home,
      page: () => HomePage(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: upgrade,
      page: () => UpgradePage(),
      binding: UpgradeBinding(),
    ),
  ];
}
