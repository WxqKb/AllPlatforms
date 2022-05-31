import 'package:get/get.dart';

import 'state.dart';

class HomeLogic extends GetxController {
  final HomeState state = HomeState();

  @override
  void onInit() {
    state.count = 20;
    super.onInit();
  }

  void increase() {
    state.count++;
    update();
  }

  void reduce() {
    state.count--;
    update();
  }

  checkUpgrade() {
    state.isChecking = true;
    update();

    Future.delayed(const Duration(seconds: 2), () {
      state.isChecking = false;
      state.hasUpgrade = true;
      update();
    });
  }
}
