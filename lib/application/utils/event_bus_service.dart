import 'dart:async';

abstract class EventBusService {
  void fire<T>(T event);
  Stream<T> on<T>();
  void off<T>();
  void destroy();
}

