import 'package:dart_playground/common/interfaces/filter_option.dart';
import 'package:dart_playground/domain/book/book_domain.dart';

final class BookFilters {
  static FilterOption<Book> byIsOnSale = BookFilterByIsOnSale();

  BookFilters._();
}

final class BookFilterByIsOnSale extends FilterOption<Book> {
  BookFilterByIsOnSale(): super(
    filterBy: (a) => a.isOnSale,
    filterOptionTitle: "Sales"
  );
}