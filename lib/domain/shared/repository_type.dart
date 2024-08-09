import 'package:dart_playground/domain/shared/aggregate_root.dart';

abstract class RepositoryType<T extends AggregateRoot> {
  Future<void> create(T entity);
  Future<T?> read(String id);
  Future<void> update(T entity);
  Future<void> delete(String id);
}