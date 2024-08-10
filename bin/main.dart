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
import 'package:get_it/get_it.dart';

final GetIt getIt = GetIt.instance;

void main() async {
  // Dependency Injection
  setupDependencies();

  final service = getIt<BookApplicationService>();
  await service.reloadBooks();
  final books = await service.listSortedFilteredBooks(
    BookQueryCriteria(type: BookType.audio, filterOption: BookFilters.byIsHasPromot)
  );
  print(books.map((book) => book.toString()));
}

// MARK: DI
void setupDependencies() {
  // Registering dependencies
  getIt.registerSingleton<HttpClient>(MockHttpClient());
  getIt.registerSingleton<BooksRemoteService>(
    MockBooksRemoteService(getIt<HttpClient>())
  );
  getIt.registerSingleton<EventBusService>(EventBus());

  // Book related dependencies
  getIt.registerSingleton<BookRepositoryType>(BookRepository());
  getIt.registerSingleton<BookQueryService>(BookQueryService());
  getIt.registerSingleton<FetchBooksUseCase>(
    FetchBooksUseCaseImpl(getIt<BooksRemoteService>())
  );
  getIt.registerSingleton<ListBooksUseCase>(
    ListBooksUseCaseImpl(getIt<BookRepositoryType>())
  );
  getIt.registerSingleton<PersistBooksUseCase>(
    PersistBooksUseCaseImpl(getIt<BookRepositoryType>())
  );
  getIt.registerSingleton<BookApplicationService>(
    BookApplicationService(
      getIt<BookQueryService>(),
      getIt<PersistBooksUseCase>(),
      getIt<FetchBooksUseCase>(),
      getIt<ListBooksUseCase>(),
      getIt<EventBusService>()
    )
  );
}