import 'package:dart_playground/ServiceLocator.dart';
import 'package:dart_playground/common/repository_type.dart';
import 'package:dart_playground/domain/book/book_domain.dart';
import 'package:dart_playground/infra/network/http_client_services.dart';
import 'package:dart_playground/infra/repository/book_storage_service.dart';

void main() {
  
  // Dependency Injection
  ServiceLocator locator = ServiceLocator();
  locator.register<RepositoryType<Book>>(BookStorageService());
  locator.register<HttpClient>(MockHttpClient());
  locator.register<BooksRemoteService>(MockBooksRemoteService(locator.get<HttpClient>()));
  
  final bookRemoteService = locator.get<BooksRemoteService>();
  final bookRepo = locator.get<RepositoryType<Book>>();

  bookRemoteService.fetch_books({})
    .then((books) {
      for (var book in books) {
        bookRepo.create(book);
      }
    });
}