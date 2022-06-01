import 'dart:async';
import 'dart:convert';

import 'package:flutter/foundation.dart';

import '../../config/apis.dart';
import '../../get/get.dart';
import 'websocket_manager_protocol.dart';

///
/// @desc webSocket工具类，暴露给业务层使用
/// @author karl_wei
/// @date 2022/6/1 08:40
///

class WsCommunicationUtil {
  final socket = getIt.get<WebSocketManagerProtocol>();

  static WsCommunicationUtil? _wsCommunication;

  int _count = 0;
  Timer? timer;

  /// 初始化时启动websocket连接
  WsCommunicationUtil._internal() {
    socket.initWebSocket(Api.webSocketUrl);
    socket.addListener(_onGameDataReceived);
  }

  /// 工厂构造函数返回单例
  factory WsCommunicationUtil() {
    _wsCommunication ??= WsCommunicationUtil._internal();
    return _wsCommunication!;
  }

  sendHandle(String action, String data) {
    socket.sendMessage(json.encode({"method": action, "param": data}));
  }

  /// 处理推送信息
  _onGameDataReceived(message) {
    if (message.toString() == "done") {
      return;
    }
    if (message.contains('pong')) {
      if (kDebugMode) {
        print('-----:>pong');
      }
      _count = 0;
      return;
    }
    // 若是连接成功，取消定时器；若是连接失败，启动定时器
    try {
      var result = json.decode(message);
      if (result['result'] != null) {
        if (result['result'] == 'connected') {
          // 业务开发一般会发送用户的token进行身份验证，请确保在connected后才发送
          // sendHandle("login", token));
          _count = 0;
          return;
        }
      }
      if (kDebugMode) print('-----result:>$result');

      switch (result['id']) {
        // 根据协议判断id
        case 'check':
          {
            break;
          }
        case 'download':
          {
            break;
          }
        case 'downloadProgress':
          {
            break;
          }
        default:
          {}
      }
    } catch (e) {
      if (kDebugMode) print(e.toString());
    }
  }

  initTimer() {
    timer?.cancel();
    timer = null;
    // 5秒发送一次ping
    timer = Timer.periodic(const Duration(seconds: 5), (timer) {
      if (kDebugMode) print("-----:>ping");

      sendHandle('ping', '123');
      _count++;
      if (_count > 3) {
        // 三次没有接收到pong，需要重连并订阅
        socket.removeAllListener();
        socket.initWebSocket(Api.webSocketUrl);
        socket.addListener(_onGameDataReceived);
      }
    });
  }

  cancelTimer() {
    timer?.cancel();
  }
}
