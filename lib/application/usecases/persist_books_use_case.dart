import 'package:dart_playground/domain/book/book_domain.dart';

abstract class PersistBooksUseCase {
  Future<void> execute(List<Book> books);
}

class PersistBooksUseCaseImpl implements PersistBooksUseCase {

  final BookRepositoryType _bookRepository;

  PersistBooksUseCaseImpl(this._bookRepository);

  Future<void> execute(List<Book> books) async {
    for (var book in books) {
      await _bookRepository.update(book);
    }
  }
}