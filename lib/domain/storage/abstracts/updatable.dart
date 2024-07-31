part of '../../book_domain.dart';

abstract class Updatable<T extends Identifiable> {
  void update(T entity);
}