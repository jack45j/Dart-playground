import 'package:dart_playground/domain/book/book_domain.dart';
import 'package:dart_playground/infra/network/endpoints/endpoints.dart';
import 'package:dart_playground/infra/network/http_client_services.dart';
import 'package:dart_playground/infra/network/response_dto/book_response.dart';

final class MockBooksRemoteService implements BooksRemoteService {
  HttpClient _client;
  MockBooksRemoteService(this._client);

  Future<List<Book>> fetch_books(Map<String, dynamic> params) {
    return _client.request(BookEndPoint.fetch_books, params).then((jsonString) {
      return BooksResponse.fromJson(jsonString).toDomain();
    });
  }
}




