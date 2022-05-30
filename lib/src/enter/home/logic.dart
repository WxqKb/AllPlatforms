import 'package:get/get.dart';

import 'state.dart';

class HomeLogic extends GetxController {
  final HomeState state = HomeState();

  @override
  void onInit() {
    state.count = 0;
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
}
