import '../lib/domain/storage/abstracts/repositoryType.dart';
import '../lib/infra/book_storage_service.dart';
import '../lib/domain/book_domain.dart';

import 'package:uuid/uuid.dart';

void main() {
  
  ServiceLocator locator = ServiceLocator();
  locator.register<RepositoryType<Book>>(BookStorageService());

  final service = locator.get<RepositoryType<Book>>();
  
  service.create(Book(Uuid().v4(), "some title"));

  
}

final class ServiceLocator {
  static final _locator = ServiceLocator._internal();

  factory ServiceLocator() => _locator;

  ServiceLocator._internal();

  void register<T>(T instance) => _locator._serviceMap[T] = instance;

  T get<T>() => _locator._serviceMap[T] as T;

  final Map<Type, dynamic> _serviceMap = {};
}