import 'package:dart_playground/ServiceLocator.dart';
import 'package:dart_playground/domain/book/book_domain.dart';
import 'package:dart_playground/common/repository_type.dart';
import 'package:dart_playground/domain/network/http_client.dart';
import 'package:dart_playground/infra/book_storage_service.dart';
import 'package:dart_playground/infra/network/mock_endpoint.dart';

void main() {
  
  // Dependency Injection
  ServiceLocator locator = ServiceLocator();
  locator.register<RepositoryType<Book>>(BookStorageService());
  locator.register<HttpClient>(MockEndpoint());
  
  final url_session = locator.get<HttpClient>();
  final service = locator.get<RepositoryType<Book>>();

  url_session.request()
    .then((books) {
      for (var book in books) {
        service.create(book);
      }
    });
}