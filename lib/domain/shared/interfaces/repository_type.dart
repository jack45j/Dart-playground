import 'package:dart_playground/domain/shared/interfaces/identifiable.dart';

abstract class RepositoryType<T extends Identifiable> {
  Future<void> create(T entity);
  Future<T?> read(String id);
  Future<void> update(T entity);
  Future<void> delete(String id);
}