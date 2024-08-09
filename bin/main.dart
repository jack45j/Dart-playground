import 'package:dart_playground/application/book/services/book_application_service.dart';
import 'package:dart_playground/application/book/network/book_remote.dart';
import 'package:dart_playground/application/book/services/book_query_service.dart';
import 'package:dart_playground/application/book/usecases/list_books_use_case.dart';
import 'package:dart_playground/application/book/usecases/fetch_books_use_case.dart';
import 'package:dart_playground/application/book/usecases/persist_books_use_case.dart';
import 'package:dart_playground/domain/book/book_domain.dart';
import 'package:dart_playground/application/utils/event_bus_service.dart';
import 'package:dart_playground/infra/event_bus.dart';
import 'package:dart_playground/infra/network/http_client_services.dart';
import 'package:dart_playground/infra/repository/book_repository.dart';
import 'package:dart_playground/infra/service_locator.dart';

void main() async {
  
  // Dependency Injection
  ServiceLocator locator = ServiceLocator();
  EventBusService eventBus = EventBus();
  setupDependencies(locator, eventBus);
  
  final service = locator.get<BookApplicationService>();
  await service.reloadBooks();
  final books = await service.listSortedFilteredBooks(BookQueryCriteria(type: BookType.audio, filterOption: BookFilters.byIsOnSale));
  print(books.map((book) => book.description));
}

// MARK: DI

void setupDependencies(ServiceLocator locator, EventBusService eventBus) {
  locator.register<HttpClient>(MockHttpClient());
  locator.register<BooksRemoteService>(MockBooksRemoteService(locator.get<HttpClient>()));

  // Book 
  locator.register<BookRepositoryType>(BookRepository());
  locator.register<BookQueryService>(BookQueryService());
  locator.register<FetchBooksUseCase>(FetchBooksUseCaseImpl(locator.get<BooksRemoteService>()));
  locator.register<ListBooksUseCase>(ListBooksUseCaseImpl(locator.get<BookRepositoryType>()));
  locator.register<PersistBooksUseCase>(PersistBooksUseCaseImpl(locator.get<BookRepositoryType>()));
  locator.register<BookApplicationService>(
    BookApplicationService(
      locator.get<BookQueryService>(),
      locator.get<PersistBooksUseCase>(),
      locator.get<FetchBooksUseCase>(),
      locator.get<ListBooksUseCase>(),
      eventBus));
}

