import 'package:dart_playground/application/network/book_remote.dart';
import 'package:dart_playground/domain/book/book_domain.dart';

abstract class FetchBooksUseCase {
  Future<List<Book>> execute();
}

class FetchBooksUseCaseImpl implements FetchBooksUseCase {

  final BooksRemoteService _bookApiService;

  FetchBooksUseCaseImpl(this._bookApiService);

  Future<List<Book>> execute() async {
    return await _bookApiService.fetchBooks({});
  }
}