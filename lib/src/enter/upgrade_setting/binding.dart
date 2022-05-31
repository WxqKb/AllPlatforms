import 'package:get/get.dart';

import 'logic.dart';

class UpgradeSettingBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => UpgradeSettingLogic());
  }
}
