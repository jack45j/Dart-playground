part of '../book_domain.dart';

abstract class BookStorageType {
  void create(Book book);
  Book? read(String id);
  void update(Book book);
  void delete(String id);
}