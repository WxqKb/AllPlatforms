import 'package:all_platforms/router/routes.dart';
import 'package:all_platforms/theme/dark_theme.dart';
import 'package:all_platforms/theme/light_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'get/get.dart';
import 'l10n/internationalization.dart';

void main() {
  configureDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      locale: Get.deviceLocale,
      translations: Internationalization(),
      theme: lightTheme,
      darkTheme: darkTheme,
      initialRoute: RouteConfig.home,
      getPages: RouteConfig.getPages,
      title: 'appName'.tr,
    );
  }
}
