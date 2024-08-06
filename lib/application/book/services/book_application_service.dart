import 'package:dart_playground/application/book/events/books_reloaded_event.dart';
import 'package:dart_playground/application/book/services/book_domain_service.dart';
import 'package:dart_playground/application/event_bus.dart';
import 'package:dart_playground/application/usecases/list_Books_use_case.dart';
import 'package:dart_playground/application/usecases/fetch_books_use_case.dart';
import 'package:dart_playground/application/usecases/persist_books_use_case.dart';
import 'package:dart_playground/domain/book/book_domain.dart';

class BookApplicationService {
  
  final BookDomainService _bookDomainService;
  final PersistBooksUseCase _persistBooksUseCase;
  final FetchBooksUseCase _fetchBooksUseCase;
  final ListBooksUseCase _listBooksUseCases;
  final EventBus _eventBus;

  BookApplicationService(
    this._bookDomainService,
    this._persistBooksUseCase,
    this._fetchBooksUseCase,
    this._listBooksUseCases,
    this._eventBus,
  );

  Future<void> reloadBooks() async {
    final books = await _fetchBooksUseCase.execute();

    await _persistBooksUseCase.execute(books);

    _eventBus.fire(BooksReloadedEvent(books));
  }

  Future<List<Book>> getAllBooks() async {
    return _listBooksUseCases.execute();
  }

  Future<List<Book>> listBooksByBookType(BookType type) async {
    final books = await _listBooksUseCases.execute();
    return _bookDomainService.filterBooksByType(type, books);
  }

  Future<List<Book>> getBooksSortedByAuthor() async {
    final books = await _listBooksUseCases.execute();
    return _bookDomainService.sortBooksByAuthor(books);
  }

  Future<List<Book>> getBooksOnSale() async {
    final books = await _listBooksUseCases.execute();
    return _bookDomainService.getBooksOnSale(books);
  }

  Price getDiscountedPrice(Book book) {
    return _bookDomainService.calculateDiscount(book);
  }
}