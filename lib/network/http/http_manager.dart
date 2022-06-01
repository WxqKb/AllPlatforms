import 'dart:io';

import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../../config/constants.dart';
import 'http_error.dart';
import 'http_manager_protocol.dart';

///
/// @desc ''
/// @author karl_wei
/// @date 2022/5/29 16:08
///

@LazySingleton(as: HttpManagerProtocol)
@Injectable(as: HttpManagerProtocol)
class HttpManager implements HttpManagerProtocol {
  final _headers = <String, String?>{};
  final dio = Dio();

  HttpManager() {
    _headers[HttpHeaders.acceptHeader] = 'application/json';
    _headers[HttpHeaders.contentTypeHeader] = 'application/json';

    final logInterceptor = LogInterceptor(
      requestBody: true,
      responseBody: true,
    );

    dio.interceptors.add(logInterceptor);

    dio.options.connectTimeout = Constants.connectTimeout;
    dio.options.receiveTimeout = Constants.receiveTimeout;
    dio.interceptors.add(QueuedInterceptor());

    dio.interceptors.add(InterceptorsWrapper(
      onResponse:
          (Response response, ResponseInterceptorHandler handler) async {
        if (response.data['status'] != null) {
          final status = response.data['status'].toString();
          // 200-请求成功
          if (status == '200') {
            handler.next(response);
            return;
          }
          // 401-无效token
          if (status == ErrorCodes.invalidToken) {
            /// [PS] 无效token，清空请求队列
            dio.interceptors.clear();
            onTokenFailure();
            handler.reject(
              DioError(
                requestOptions: response.requestOptions,
                error: ServerException(
                  code: status,
                  errMsg: response.data['message'],
                ),
              ),
            );
            return;
          } else if (status == ErrorCodes.serverError) {
            handler.reject(
              DioError(
                  requestOptions: response.requestOptions,
                  error: ServerException(code: status, errMsg: '服务开小差啦，请稍后再试')),
            );
            return;
          } else {
            handler.reject(
              DioError(
                requestOptions: response.requestOptions,
                error: ServerException(
                    code: status, errMsg: response.data['message']),
              ),
            );
            return;
          }
        }
        handler.next(response);
        return;
      },
      onError: (DioError error, ErrorInterceptorHandler handler) {
        if (error.type == DioErrorType.connectTimeout) {
          handler.reject(
            DioError(
              requestOptions: error.requestOptions,
              error: const ServerException(errMsg: '请求超时，请检查您的网络设置'),
            ),
          );
          return;
        } else if (error.type == DioErrorType.sendTimeout) {
          handler.reject(
            DioError(
              requestOptions: error.requestOptions,
              error: const ServerException(errMsg: '请求超时，请检查您的网络设置'),
            ),
          );
          return;
        } else if (error.type == DioErrorType.receiveTimeout) {
          handler.reject(
            DioError(
              requestOptions: error.requestOptions,
              error: const ServerException(errMsg: '服务响应超时，请联系服务商'),
            ),
          );
          return;
        } else if (error.error != null && error.error is SocketException) {
          handler.reject(
            DioError(
              requestOptions: error.requestOptions,
              error: const ServerException(errMsg: '网络连接失败，请检查您的网络设置'),
            ),
          );
          return;
        } else if (error.response?.statusCode == 404) {
          handler.reject(
            DioError(
              requestOptions: error.requestOptions,
              error: const ServerException(errMsg: '路径不存在，请联系系统管理员'),
            ),
          );
          return;
        } else {
          handler.reject(
            DioError(
              requestOptions: error.requestOptions,
              error: ServerException(
                errMsg: error.message.isEmpty
                    ? '网络连接异常，请检查您的网络设置'
                    : error.error.toString(),
              ),
            ),
          );
          return;
        }
      },
    ));
  }

  @override
  void configureDefaultHeaders(Map<String, String?> headers) {
    if (headers.isEmpty) return;

    dio.options.headers
      ..addAll(headers)
      ..removeWhere((k, v) => v == null);
  }

  @override
  Future delete(
      {required String url,
      Map<String, dynamic>? query,
      Map<String, String>? headers}) async {
    try {
      final response = await dio.delete(url, queryParameters: query);
      return response.data;
    } on DioError catch (e) {
      return Future.error(e.error);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future get(
      {required String url,
      Map<String, dynamic>? query,
      Map<String, String>? headers}) async {
    try {
      final response = await dio.get(url, queryParameters: query);
      return response.data;
    } on DioError catch (e) {
      return Future.error(e.error);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future post(
      {required String url,
      Map? body,
      Map<String, dynamic>? query,
      Map<String, dynamic>? headers}) async {
    try {
      Options? options;
      if (headers != null) {
        options = Options(headers: headers);
      }
      final response = await dio.post(url,
          data: body, queryParameters: query, options: options);
      return response.data;
    } on DioError catch (e) {
      return Future.error(e.error);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future put(
      {required String url,
      Map? body,
      Map<String, dynamic>? query,
      Map<String, String>? headers}) async {
    try {
      final response = await dio.put(url, data: body, queryParameters: query);
      return response.data;
    } on DioError catch (e) {
      return Future.error(e.error);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future upload(
      {required String url,
      required String filePath,
      List<MapEntry<String, String>>? fields,
      Map<String, String>? headers,
      CancelToken? cancelToken}) {
    // TODO: implement upload
    throw UnimplementedError();
  }

  @override
  Future downloadFile(
      {required String url,
      required String savePath,
      required CancelToken cancelToken,
      ProgressCallback? onReceiveProgress,
      void Function()? done,
      void Function(Exception p1)? failed}) {
    throw UnimplementedError();
  }

  void onTokenFailure() {}
}
