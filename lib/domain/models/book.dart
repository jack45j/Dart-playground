part of '../book_domain.dart';

class Book implements Identifiable {
  String id;
  String title;
  
  Book(this.id, this.title);
}