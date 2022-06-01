import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:web_socket_channel/io.dart';

import 'websocket_manager_protocol.dart';

///
/// @desc webSocket管理，提供基础功能
/// @author karl_wei
/// @date 2022/5/31 19:44
///

@LazySingleton(as: WebSocketManagerProtocol)
@Injectable(as: WebSocketManagerProtocol)
class WebSocketManager extends WebSocketManagerProtocol {
  late IOWebSocketChannel _channel;
  bool _isConnect = false;

  final ObserverList<Function> _webSocketListeners = ObserverList<Function>();

  @override
  void addListener(Function callback) {}

  @override
  void close() {
    _channel.sink.close();
    _isConnect = false;
  }

  @override
  void initWebSocket(String wsUrl) {
    close();
    _channel = IOWebSocketChannel.connect(wsUrl);
    _channel.stream.listen((msg) {
      receptionMessage(msg);
    }, onError: _onError, onDone: _onDone);
  }

  @override
  void receptionMessage(String msg) {
    _isConnect = true;
    for (var callback in _webSocketListeners) {
      callback(msg);
    }
  }

  @override
  void removeAllListener() {
    try {
      for (int i = 0; i < _webSocketListeners.length; i++) {
        removeListener(_webSocketListeners.elementAt(i));
      }
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }

  @override
  void removeListener(Function callback) {
    _webSocketListeners.remove(callback);
  }

  @override
  void sendMessage(String msg) {
    if (_isConnect) {
      _channel.sink.add(msg);
    }
  }

  //  接收消息发生错误
  _onError(error, StackTrace stackTrace) {
    if (kDebugMode) {
      print(" ------- connect error -------");
    }
    for (var callback in _webSocketListeners) {
      try {
        callback(error, stackTrace);
        callback(error);
      } catch (e) {
        if (kDebugMode) {
          print(e);
        }
      }
    }
  }

  _onDone() {
    if (kDebugMode) {
      print(" ------- webSocket done -------");
    }
  }
}
