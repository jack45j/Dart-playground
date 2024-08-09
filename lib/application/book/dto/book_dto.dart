import 'package:dart_playground/domain/book/book_domain.dart';

class BookDTO {
  final String title;
  final String description;
  final String author;
  final DateTime publishingDate;

  BookDTO({required this.title, required this.description, required this.author, required this.publishingDate});
  
  static BookDTO fromDomain(Book domain) {
    return BookDTO(
      title: domain.title, 
      description: domain.desc,
      author: domain.collaboratos.author, 
      publishingDate: domain.publishing.pubDate);
  }
}