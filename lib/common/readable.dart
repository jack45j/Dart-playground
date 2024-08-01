import 'package:dart_playground/common/identifiable.dart';

abstract class Readable<T extends Identifiable> {
  T? read(String id);
}