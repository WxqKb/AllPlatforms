///
/// @desc ''
/// @author karl_wei
/// @date 2022/5/30 09:50
///

import 'package:dio/dio.dart';

abstract class HttpManagerProtocol {
  /// 设置请求头
  void configureDefaultHeaders(Map<String, String?> headers);

  Future<dynamic> get({
    required String url,
    Map<String, dynamic>? query,
    Map<String, String>? headers,
  });

  Future<dynamic> post({
    required String url,
    Map? body,
    Map<String, dynamic>? query,
    Map<String, dynamic>? headers,
  });

  Future<dynamic> put({
    required String url,
    Map? body,
    Map<String, dynamic>? query,
    Map<String, String>? headers,
  });

  Future<dynamic> delete({
    required String url,
    Map<String, dynamic>? query,
    Map<String, String>? headers,
  });

  Future<dynamic> upload({
    required String url,
    required String filePath,
    List<MapEntry<String, String>>? fields,
    Map<String, String>? headers,
    CancelToken? cancelToken,
  });

  Future<dynamic> downloadFile({
    required String url,
    required String savePath,
    required CancelToken cancelToken,
    ProgressCallback? onReceiveProgress,
    void Function()? done,
    void Function(Exception)? failed,
  });
}
