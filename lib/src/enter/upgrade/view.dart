import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../home/logic.dart';
import 'logic.dart';

class UpgradePage extends StatelessWidget {
  final logic = Get.find<UpgradeLogic>();
  final state = Get.find<UpgradeLogic>().state;

  final firstLogic = Get.find<HomeLogic>();
  UpgradePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('第二页'),
      ),
      body: Center(
        child: Text('hello'.tr),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          firstLogic.reduce();
        },
        child: const Icon(Icons.indeterminate_check_box),
      ),
    );
  }
}
