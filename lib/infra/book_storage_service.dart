import 'package:dart_playground/domain/book/book.dart';
import 'package:dart_playground/common/repository_type.dart';

class BookStorageService implements RepositoryType<Book> {
  Map<String, Book> cached = {};

  Future<void> create(Book book) async {
    cached[book.id] = book;
    print(book.bookType);
    print(cached.toString());
  }
  
  Future<void> delete(String id) async {
    cached.remove(id);
    print(cached.toString());
  }
  
  Future<Book?> read(String id) async {
    Book? book = cached[id];
    print(cached.toString());
    return book;
  }
  
  Future<void> update(Book book) async {
    cached[book.id] = book;
    print(cached.toString());
  }
}