import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../components/app_bar.dart';
import 'logic.dart';

class UpgradeInfoPage extends StatelessWidget {
  final logic = Get.find<UpgradeInfoLogic>();
  final state = Get.find<UpgradeInfoLogic>().state;

  UpgradeInfoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar.globalAppBar(context, title: 'upgradeInfo'.tr),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 32.w, vertical: 24.h),
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: Theme.of(context).primaryColor,
            borderRadius: BorderRadius.all(Radius.circular(8.w)),
          ),
          padding: EdgeInsets.fromLTRB(24.w, 44.h, 24.w, 24.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'deviceIsUpDate'.tr,
                style:
                    Theme.of(context).textTheme.bodyText1?.copyWith(height: 1),
              ),
              SizedBox(height: 42.h),
              Divider(height: 1.h),
            ],
          ),
        ),
      ),
    );
  }
}
