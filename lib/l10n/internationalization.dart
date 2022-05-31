import 'package:get/get_navigation/src/root/internacionalization.dart';

///
/// @desc ''
/// @author karl_wei
/// @date 2022/5/30 15:29
///

class Internationalization extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'en_US': {
          'hello': 'Hello World',
          'appName': 'System Upgrade',
          'currentVersion': 'Current Version: @version',
          'checkNow': 'Check now',
          'upgradeSetting': 'Upgrade Setting',
          'autoUpgrade': 'Auto Upgrade',
          'autoUpgradeTips': '若会议平板检测到更新，将在20:00—第二天6:00期间自动进行更新安装，安装前将会收到通知',
          'upgradeInfo': 'Upgrade Info',
          'deviceIsUpDate': 'Your device is up to date!',
          'checking': 'Checking...'
        },
        'zh': {
          'hello': '你好，世界',
          'appName': '系统升级',
          'currentVersion': '当前版本：@version',
          'checkNow': '立即检测',
          'upgradeSetting': '更新设置',
          'autoUpgrade': '自动升级',
          'autoUpgradeTips': '若会议平板检测到更新，将在20:00—第二天6:00期间自动进行更新安装，安装前将会收到通知',
          'upgradeInfo': '版本信息',
          'deviceIsUpDate': '您的设备已是最新！',
          'checking': '正在检测...'
        }
      };
}
