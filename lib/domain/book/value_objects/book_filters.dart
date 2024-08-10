import 'package:dart_playground/common/interfaces/filter_option.dart';
import 'package:dart_playground/domain/book/book_domain.dart';

final class BookFilters {
  static FilterOption<Book> byIsHasPromot = BookFilterByIsHasPromot();

  BookFilters._();
}

final class BookFilterByIsHasPromot extends FilterOption<Book> {
  BookFilterByIsHasPromot(): super(
    filterBy: (a) => a.isHasPromot,
    filterOptionTitle: "Sales"
  );
}