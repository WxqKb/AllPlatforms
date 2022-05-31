import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../components/app_bar.dart';
import '../../../components/primary_button.dart';
import '../../../config/asset_name.dart';
import '../../../router/routes.dart';
import '../widget/checking_animation.dart';
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
        child: GetBuilder<HomeLogic>(builder: (logic) {
          return state.isChecking
              ? buildCheckingView(context)
              : buildNormalView(context);
        }),
      ),
    );
  }

  Widget buildNormalView(BuildContext context) {
    return Column(
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
            state.hasUpgrade
                ? Positioned(
                    bottom: 8.w,
                    right: -41.w,
                    child: Image.asset(
                      AssetNames.imgSearch,
                      width: 80.w,
                      height: 80.w,
                    ),
                  )
                : Positioned(
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
        Text(
          state.hasUpgrade
              ? '发现设备有可用更新'
              : 'currentVersion'.trParams({'version': '${state.count}'}),
          style: Theme.of(context).textTheme.headline1?.copyWith(height: 1),
        ),
        SizedBox(height: 64.h),
        Badge(
          showBadge: state.hasUpgrade,
          padding: EdgeInsets.all(8.w),
          position: BadgePosition(end: 0.w, top: 0),
          child: PrimaryButton(
            enabled: true,
            title: state.hasUpgrade ? '查看详情' : 'checkNow'.tr,
            onTap: () {
              if (state.hasUpgrade) {
                Get.toNamed(RouteConfig.upgradeInfo);
              } else {
                logic.checkUpgrade();
              }
            },
          ),
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
    );
  }

  Widget buildCheckingView(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const CheckingAnimation(),
        SizedBox(height: 40.h),
        Text('checking'.tr, style: Theme.of(context).textTheme.bodyText2),
      ],
    );
  }
}
