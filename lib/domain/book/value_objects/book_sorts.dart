import 'package:dart_playground/common/interfaces/sort_option.dart';
import 'package:dart_playground/domain/book/book_domain.dart';

class BookSorts {
  static SortOption<Book> byTitle = BookSortByTitle();
  static SortOption<Book> byAuthor = BookSortByAuthor();
  static SortOption<Book> byId = BookSortById();

  BookSorts._();
}

final class BookSortById extends SortOption<Book> {
  BookSortById(): super(
    sortBy: (a, b) => a.uniqId.id.compareTo(b.uniqId.id),
    sortOptionTitle: "Sort By ID"
  );
}

final class BookSortByAuthor extends SortOption<Book> {
  BookSortByAuthor(): super(
    sortBy: (a, b) => a.collaboratos.author.compareTo(b.collaboratos.author),
    sortOptionTitle: "Sort By Author"
  );
}

final class BookSortByTitle extends SortOption<Book> {
  BookSortByTitle(): super(
    sortBy: (a, b) => a.title.compareTo(b.title),
    sortOptionTitle: "Sort By Title"
  );
}