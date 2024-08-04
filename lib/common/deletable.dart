import 'package:dart_playground/common/identifiable.dart';

abstract class Deletable<T extends Identifiable> {
  Future<void> delete(String id);
}