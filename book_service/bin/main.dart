import '../lib/infra/book_storage_service.dart';
import '../lib/domain/book_domain.dart';

void main() {
  BookStorageType service = SomeStorageService();
  Book book = Book("some id 1", "some title1");
  
  service.create(book);
}