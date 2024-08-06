import 'package:dart_playground/application/book/services/book_application_service.dart';
import 'package:dart_playground/application/book/services/book_domain_service.dart';
import 'package:dart_playground/application/usecases/list_Books_use_case.dart';
import 'package:dart_playground/application/usecases/fetch_books_use_case.dart';
import 'package:dart_playground/application/usecases/persist_books_use_case.dart';
import 'package:dart_playground/domain/book/book_domain.dart';
import 'package:dart_playground/application/event_bus.dart';
import 'package:dart_playground/infra/network/http_client_services.dart';
import 'package:dart_playground/infra/repository/book_repository.dart';
import 'package:dart_playground/infra/service_locator.dart';

void main() async {
  
  // Dependency Injection
  ServiceLocator locator = ServiceLocator();
  EventBus eventBus = EventBus();
  setupDependencies(locator, eventBus);
  
  final service = locator.get<BookApplicationService>();
  await service.reloadBooks();
  final books = await service.getAllBooks();
  print(books);

  final promoBooks = await service.getBooksOnSale();
  print(promoBooks[0].price.amount);
  print(service.getDiscountedPrice(promoBooks[0]).amount);
}

void setupDependencies(ServiceLocator locator, EventBus eventBus) {
  locator.register<HttpClient>(MockHttpClient());
  locator.register<BooksRemoteService>(MockBooksRemoteService(locator.get<HttpClient>()));

  // Book 
  locator.register<BookRepositoryType>(BookRepository());
  locator.register<FetchBooksUseCase>(FetchBooksUseCaseImpl(locator.get<BooksRemoteService>()));
  locator.register<ListBooksUseCase>(ListBooksUseCaseImpl(locator.get<BookRepositoryType>()));
  locator.register<PersistBooksUseCase>(PersistBooksUseCaseImpl(locator.get<BookRepositoryType>()));
  locator.register<BookApplicationService>(
    BookApplicationService(
      BookDomainService(),
      locator.get<PersistBooksUseCase>(),
      locator.get<FetchBooksUseCase>(),
      locator.get<ListBooksUseCase>(),
      eventBus));
}