import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../components/app_bar.dart';
import '../home/logic.dart';
import 'logic.dart';

class UpgradeSettingPage extends StatelessWidget {
  final logic = Get.find<UpgradeSettingLogic>();
  final state = Get.find<UpgradeSettingLogic>().state;

  final firstLogic = Get.find<HomeLogic>();
  UpgradeSettingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar.globalAppBar(context, title: 'upgradeSetting'.tr),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 32.w, vertical: 24.h),
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: Theme.of(context).primaryColor,
            borderRadius: BorderRadius.all(Radius.circular(8.w)),
          ),
          padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 14.h),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'autoUpgrade'.tr,
                      style: Theme.of(context).textTheme.bodyText2,
                    ),
                    SizedBox(height: 6.h),
                    Text(
                      'autoUpgradeTips'.tr,
                      style: Theme.of(context).textTheme.subtitle2,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 24.h,
                width: 40.w,
                child: CupertinoSwitch(
                  activeColor: const Color(0xFF038DFF),
                  value: false,
                  onChanged: (bool value) {},
                ),
              ),
            ],
          ),
        ),
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
