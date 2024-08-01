import 'package:dart_playground/common/identifiable.dart';

abstract class Creatable<T extends Identifiable> {
  void create(T entity);
}