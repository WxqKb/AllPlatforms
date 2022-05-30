import 'package:get/get.dart';

import 'logic.dart';

class UpgradeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => UpgradeLogic());
  }
}
