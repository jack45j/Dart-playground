import 'package:dart_playground/ServiceLocator.dart';
import 'package:dart_playground/domain/book/book_domain.dart';
import 'package:dart_playground/common/repository_type.dart';
import 'package:dart_playground/infra/book_storage_service.dart';
import 'package:uuid/uuid.dart';

void main() {
  
  ServiceLocator locator = ServiceLocator();
  locator.register<RepositoryType<Book>>(BookStorageService());

  final service = locator.get<RepositoryType<Book>>();
  
  service.create(Book(Uuid().v4(), "some title"));
  service.create(Book(Uuid().v4(), "some title1"));
}


