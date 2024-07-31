part of '../../book_domain.dart';

abstract class Creatable<T extends Identifiable> {
  void create(T entity);
}