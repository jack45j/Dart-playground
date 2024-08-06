import 'dart:async';

class EventBus {
  // 單例模式
  static final EventBus _instance = EventBus._internal();
  factory EventBus() => _instance;
  EventBus._internal();

  // 使用 Map 來存儲事件及其對應的訂閱者
  final _eventStreams = <Type, StreamController<dynamic>>{};

  // 發布事件
  void fire<T>(T event) {
    if (_eventStreams.containsKey(T)) {
      _eventStreams[T]!.add(event);
    }
  }

  // 訂閱事件
  Stream<T> on<T>() {
    if (!_eventStreams.containsKey(T)) {
      _eventStreams[T] = StreamController<T>.broadcast();
    }
    return _eventStreams[T]!.stream as Stream<T>;
  }

  // 取消訂閱
  void off<T>() {
    if (_eventStreams.containsKey(T)) {
      _eventStreams[T]!.close();
      _eventStreams.remove(T);
    }
  }

  // 銷毀 EventBus
  void destroy() {
    _eventStreams.forEach((_, controller) => controller.close());
    _eventStreams.clear();
  }
}