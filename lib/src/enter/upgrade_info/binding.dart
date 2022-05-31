import 'package:get/get.dart';

import 'logic.dart';

class UpgradeInfoBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => UpgradeInfoLogic());
  }
}
