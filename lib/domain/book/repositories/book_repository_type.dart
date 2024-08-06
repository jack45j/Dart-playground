import 'package:dart_playground/domain/shared/interfaces/repository_type.dart';
import 'package:dart_playground/domain/book/book_domain.dart';

abstract class BookRepositoryType implements RepositoryType<Book> {
  Future<List<Book>> listAll();
}