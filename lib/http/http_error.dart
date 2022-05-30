///
/// @desc ''
/// @author karl_wei
/// @date 2022/5/30 10:03
///

class ErrorCodes {
  static const serverError = '500'; // 服务器异常
  static const invalidToken = '401'; // 会话失效
}

class ServerException {
  final String? code;
  final String errMsg;

  const ServerException({this.code, required this.errMsg});
}
