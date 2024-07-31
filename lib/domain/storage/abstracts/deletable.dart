part of '../../book_domain.dart';

abstract class Deletable<T extends Identifiable> {
  void delete(String id);
}