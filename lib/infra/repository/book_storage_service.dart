import 'package:dart_playground/domain/book/book.dart';
import 'package:dart_playground/common/repository_type.dart';

class BookStorageService implements RepositoryType<Book> {
  Map<String, Book> cached = {};

  Future<void> create(Book book) async {
    cached[book.id] = book;
  }

  Future<void> delete(String id) async {
    cached.remove(id);
  }

  Future<Book?> read(String id) async {
    Book? book = cached[id];
    return book;
  }

  Future<void> update(Book book) async {
    cached[book.id] = book;
  }
}
