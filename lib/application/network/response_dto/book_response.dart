import 'dart:convert';
import 'package:dart_playground/domain/book/book_domain.dart';
import 'package:dart_playground/domain/shared/value_objects/currency.dart';

class BooksResponse {
  final List<BookResponseDto> data;

  BooksResponse({required this.data});

  static BooksResponse fromJson(String jsonString) {
    Map<String, dynamic> jsonMap = json.decode(jsonString);
    List<dynamic> jsonData = jsonMap['data'];
    List<BookResponseDto> dtoList = jsonData
      .map((item) => BookResponseDto.fromJson(item))
      .toList();
    return BooksResponse(data: dtoList);
  }

  List<Book> toDomain() {
    return data.map((dto) {
      return Book(
        dto.id, 
        dto.title, 
        dto.description, 
        Collaborators(dto.author), 
        ISBN(dto.isbn), 
        Publishing(dto.publisher, DateTime.parse(dto.publicationDate)), 
        Language(dto.language), 
        Price(dto.price.toDouble(), Currency.from(dto.currency)), 
        CoverImage(Uri.parse(dto.coverUrl)),
        dto.discounted);
    })
    .whereType<Book>()
    .toList();
  }
}

class BookResponseDto {
  String id;
  String title;
  String author;
  String coverUrl;
  String isbn;
  String publisher;
  String publicationDate;
  String language;
  num price;
  num? discounted;
  String currency;
  String description;

  BookResponseDto({
    required this.id,
    required this.title,
    required this.author,
    required this.coverUrl,
    required this.isbn,
    required this.publisher,
    required this.publicationDate,
    required this.language,
    required this.price,
    required this.currency,
    required this.discounted,
    required this.description,
  });

  @override
  String toString() {
    return 'BookResponseDto(id: $id, title: $title, author: $author, coverUrl: $coverUrl, isbn: $isbn, publisher: $publisher, publicationDate: $publicationDate, language: $language, price: $price, currency: $currency, discounted: $discounted, description: $description)';
  }

  factory BookResponseDto.fromJson(Map<String, dynamic> json) {
    return BookResponseDto(
      id: json['id'].toString(),
      title: json['title'].toString(),
      author: json['author'].toString(),
      coverUrl: json['cover_url'].toString(),
      isbn: json['isbn'].toString(),
      publisher: json['publisher'].toString(),
      publicationDate: json['publication_date'].toString(),
      language: json['language'].toString(),
      price: num.tryParse(json['price'].toString()) ?? 0,
      currency: json['currency'].toString(),
      discounted: json['discounted'] as num?,
      description: json['description'].toString(),
    );
  }
}