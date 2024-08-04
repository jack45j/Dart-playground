import 'package:dart_playground/domain/book/book_domain.dart';

abstract class BooksRemoteService {
  Future<List<Book>> fetch_books(Map<String, dynamic> params);
}