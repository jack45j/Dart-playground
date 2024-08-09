import 'package:dart_playground/domain/book/book_domain.dart';
import 'package:dart_playground/common/interfaces/filter_option.dart';
import 'package:dart_playground/common/interfaces/sort_option.dart';

class BookQueryCriteria {
  final BookType? type;
  final SortOption<Book>? sortOption;
  final FilterOption<Book>? filterOption;

  BookQueryCriteria({this.type, this.sortOption, this.filterOption});
}