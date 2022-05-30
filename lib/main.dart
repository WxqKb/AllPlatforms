import 'dart:io';

import 'package:all_platforms/router/routes.dart';
import 'package:all_platforms/theme/dark_theme.dart';
import 'package:all_platforms/theme/light_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:window_manager/window_manager.dart';

import 'get/get.dart';
import 'l10n/internationalization.dart';

void main() async {
  // 初始化基础数据
  configureDependencies();
  if (Platform.isWindows || Platform.isMacOS) {
    await initWindow();
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
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

initWindow() async {
  WidgetsFlutterBinding.ensureInitialized();
  await windowManager.ensureInitialized();

  WindowOptions windowOptions = WindowOptions(
    size: const Size(800, 600),
    center: true,
    fullScreen: true,
    backgroundColor: Colors.transparent,
    skipTaskbar: false,
    titleBarStyle: TitleBarStyle.hidden,
  );
  windowManager.waitUntilReadyToShow(windowOptions, () async {
    await windowManager.show();
    await windowManager.focus();
  });
}
