import 'package:dart_playground/domain/book/book_domain.dart';

class BooksReloadedEvent {
  final List<Book> books;
  BooksReloadedEvent(this.books);
}