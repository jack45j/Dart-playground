import 'package:dart_playground/common/identifiable.dart';

abstract class Creatable<T extends Identifiable> {
  Future<void> create(T entity);
}