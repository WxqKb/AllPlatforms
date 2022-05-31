import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../components/app_bar.dart';
import '../../../components/primary_button.dart';
import '../../../config/asset_name.dart';
import '../../../router/routes.dart';
import 'logic.dart';

class HomePage extends StatelessWidget {
  final logic = Get.find<HomeLogic>();
  final state = Get.find<HomeLogic>().state;

  HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar.globalAppBar(context,
          title: 'appName'.tr, needLeading: false),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            SizedBox(height: 90.h),
            Stack(
              clipBehavior: Clip.none,
              children: [
                Image.asset(
                  AssetNames.imgDevice,
                  width: 324.w,
                  height: 200.h,
                  fit: BoxFit.cover,
                ),
                Positioned(
                  bottom: 8.w,
                  right: -16.w,
                  child: Image.asset(
                    AssetNames.imgGrass,
                    width: 60.w,
                    height: 80.w,
                  ),
                ),
              ],
            ),
            SizedBox(height: 36.h),
            GetBuilder<HomeLogic>(builder: (logic) {
              return Text(
                'currentVersion'.trParams({'version': '${state.count}'}),
                style:
                    Theme.of(context).textTheme.headline1?.copyWith(height: 1),
              );
            }),
            SizedBox(height: 64.h),
            PrimaryButton(
              enabled: true,
              title: 'checkNow'.tr,
              onTap: () {
                Get.toNamed(RouteConfig.upgradeInfo);
              },
            ),
            SizedBox(height: 126.h),
            GestureDetector(
              onTap: () {
                Get.toNamed(RouteConfig.upgradeSetting);
              },
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset(
                    AssetNames.icSetting,
                    width: 16.w,
                    height: 16.h,
                  ),
                  SizedBox(width: 6.w),
                  Text(
                    'upgradeSetting'.tr,
                    style: Theme.of(context).textTheme.subtitle1,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () => logic.increase(),
      //   tooltip: 'Increment',
      //   child: const Icon(Icons.add),
      // ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
