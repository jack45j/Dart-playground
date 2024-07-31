import '../domain/book_domain.dart';
import '../domain/storage/abstracts/repositoryType.dart';

class BookStorageService implements RepositoryType<Book> {
  Map<String, Book> cached = {};
  
  void create(Book book) {
    cached[book.id] = book;
    print(cached);
  }
  
  void delete(String id) {
    cached.remove(id);
    print(cached);
  }
  
  Book? read(String id) {
    Book? book = cached[id];
    print(cached);
    return book;
  }
  
  void update(Book book) {
    cached[book.id] = book;
    print(cached);
  }
}