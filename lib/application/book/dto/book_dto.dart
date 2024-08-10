// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dart_playground/domain/book/book_domain.dart';
import 'package:dart_playground/domain/shared/shared.dart';

class BookDTO {
  final String title;
  final String description;
  final String author;
  final DateTime publishingDate;
  final List<PromotionCode> promotions;

  BookDTO({
    required this.title,
    required this.description,
    required this.author,
    required this.publishingDate,
    required this.promotions,
  });
  
  static BookDTO fromDomain(Book domain) {
    return BookDTO(
      title: domain.title, 
      description: domain.desc,
      author: domain.collaboratos.author, 
      publishingDate: domain.publishing.pubDate,
      promotions: domain.promotions);
  }

  @override
  String toString() {
    return 'BookDTO(title: $title, description: $description, author: $author, publishingDate: $publishingDate, promotions: $promotions)';
  }
}
