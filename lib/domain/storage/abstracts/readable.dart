part of '../../book_domain.dart';

abstract class Readable<T extends Identifiable> {
  T? read(String id);
}