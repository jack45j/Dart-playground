import 'package:dart_playground/common/identifiable.dart';

abstract class Updatable<T extends Identifiable> {
  void update(T entity);
}