import 'package:dart_playground/domain/shared/identifiable.dart';

abstract class AggregateRoot<T extends Identifiable> {
  T get uniqId;
}