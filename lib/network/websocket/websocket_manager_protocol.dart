///
/// @desc ''
/// @author karl_wei
/// @date 2022/5/31 19:34
///

abstract class WebSocketManagerProtocol {
  void initWebSocket(String wsUrl);

  void close();

  void addListener(Function callback);

  void removeListener(Function callback);

  void removeAllListener();

  void sendMessage(String msg);

  void receptionMessage(String msg);
}
