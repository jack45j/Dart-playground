import 'package:dart_playground/common/identifiable.dart';

abstract class Readable<T extends Identifiable> {
  Future<T?> read(String id);
}