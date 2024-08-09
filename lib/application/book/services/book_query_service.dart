import 'package:dart_playground/domain/book/book_domain.dart';

final class BookQueryService {
  List<Book> filterBooksByType(List<Book> books, BookType type) {
    return books.where((book) => book.bookType == type).toList();
  }

  List<Book> filterAndSortBooks(List<Book> books, BookQueryCriteria criteria) {
    return books
      .where((book) => criteria.type == null || book.bookType == criteria.type)
      .where(criteria.filterOption?.filterBy ?? ((book) => true))
      .toList()
      ..sort(criteria.sortOption?.sortBy ?? BookSorts.byId.sortBy);
  }
}