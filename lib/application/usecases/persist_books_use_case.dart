import 'package:dart_playground/domain/book/book_domain.dart';

abstract class PersistBooksUseCase {
  Future<void> execute(List<Book> books);
}

class PersistBooksUseCaseImpl implements PersistBooksUseCase {

  final BookRepositoryType _bookRepository;

  PersistBooksUseCaseImpl(this._bookRepository);

  Future<void> execute(List<Book> books) async {
    await _bookRepository.batchUpdate(books);
  }
}