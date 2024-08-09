import 'package:dart_playground/domain/shared/aggregate_root.dart';
import 'package:dart_playground/domain/shared/repository_type.dart';
import 'package:dart_playground/domain/book/book_domain.dart';

mixin BatchExecute<T extends AggregateRoot> on RepositoryType<T> {
  Future<void> batchUpdate(List<T> items) async {
    for (final item in items) {
      await update(item);
    }
  }
}

abstract class BookRepositoryType extends RepositoryType<Book> with BatchExecute<Book> {
  Future<List<Book>> listAll();
}