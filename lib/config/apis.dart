///
/// @desc ''
/// @author karl_wei
/// @date 2022/5/29 15:58
///

class Api {
  static const bool isProduction = bool.fromEnvironment('dart.vm.product');
  static const String _baseUrl = isProduction ? _releaseUrl : _debugUrl;


  static const String _debugUrl = "https://";
  static const String _releaseUrl = "https://";


  static const String webSocketUrl = 'localhost';

  static const String login = "$_baseUrl/login";
}
