import 'package:dart_playground/domain/book/book_domain.dart';

class BookRepository extends BookRepositoryType with BatchExecute<Book> {
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

  Future<List<Book>> listAll() async {
    return cached.values.toList();
  }
}