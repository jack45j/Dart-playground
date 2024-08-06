import 'package:dart_playground/domain/book/book_domain.dart';

abstract class ListBooksUseCase {
  Future<List<Book>> execute();
}

class ListBooksUseCaseImpl implements ListBooksUseCase {

  final BookRepositoryType _bookRepository;

  ListBooksUseCaseImpl(this._bookRepository);

  Future<List<Book>> execute() async {
    return _bookRepository.listAll();
  }
}