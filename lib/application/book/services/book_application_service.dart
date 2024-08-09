import 'package:dart_playground/application/book/dto/book_dto.dart';
import 'package:dart_playground/domain/book/events/books_reloaded_event.dart';
import 'package:dart_playground/application/book/services/book_query_service.dart';
import 'package:dart_playground/application/utils/event_bus_service.dart';
import 'package:dart_playground/application/book/usecases/list_books_use_case.dart';
import 'package:dart_playground/application/book/usecases/fetch_books_use_case.dart';
import 'package:dart_playground/application/book/usecases/persist_books_use_case.dart';
import 'package:dart_playground/domain/book/book_domain.dart';

class BookApplicationService {
  
  final BookQueryService _bookQueryService;
  final PersistBooksUseCase _persistBooksUseCase;
  final FetchBooksUseCase _fetchBooksUseCase;
  final ListBooksUseCase _listBooksUseCases;
  final EventBusService _eventBus;

  BookApplicationService(
    this._bookQueryService,
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

  // MARK: List

  Future<List<BookDTO>> listBooksByBookType(BookType type) async {
    final books = await _listBooksUseCases.execute();
    return _bookQueryService.filterBooksByType(books, type).toDTO();
  }

  Future<List<BookDTO>> listAllBooks() async {
    final books = await _listBooksUseCases.execute();
    return books.toDTO();
  }

  Future<List<BookDTO>> listSortedFilteredBooks(BookQueryCriteria criteria) async {
    final books = await _listBooksUseCases.execute();
    return _bookQueryService.filterAndSortBooks(books, criteria).toDTO();
  }
}

extension BookListExtension on List<Book> {
  List<BookDTO> toDTO() {
    return map((book) => BookDTO.fromDomain(book)).toList();
  }
}