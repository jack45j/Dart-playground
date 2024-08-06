import 'package:dart_playground/domain/book/book_domain.dart';

class BookDomainService {

  List<Book> sortBooksByAuthor(List<Book> books) {
    return List.from(books)..sort((a, b) => a.collaboratos.author.compareTo(b.collaboratos.author));
  }

  List<Book> filterBooksByType(BookType type, List<Book> books) {
    return List.from(books)..where((book) => (book.bookType == type));
  }

  List<Book> getBooksOnSale(List<Book> books) {
    return books.where((book) => book.isOnSale).toList();
  }

  Price calculateDiscount(Book book) {
    if (!book.isOnSale) {
      return book.price;
    }
    
    return Price(
      (book.price.amount * (book.discounted ?? 1) * 100).ceil() / 100,
      book.price.unit
    );
  }
}