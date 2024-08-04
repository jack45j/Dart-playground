import 'dart:convert';
import 'package:dart_playground/domain/book/book_domain.dart';

class BooksResponse {
  final List<BookResponseDTO> data;

  BooksResponse({required this.data});

  static BooksResponse fromJson(String jsonString) {
    Map<String, dynamic> jsonMap = json.decode(jsonString);
    List<dynamic> jsonData = jsonMap['data'];
    List<BookResponseDTO> dtoList = jsonData
      .map((item) => BookResponseDTO.fromJson(item))
      .toList();
    return BooksResponse(data: dtoList);
  }

  List<Book> toDomain() {
    return this.data.map((dto) => Book(dto.id, dto.title))
      .toList();
  }
}

class BookResponseDTO {
  final String id;
  final String title;
  final String author;

  BookResponseDTO({required this.id, required this.title, required this.author});

  factory BookResponseDTO.fromJson(Map<String, dynamic> json) {
    return BookResponseDTO(
      id: json['id'],
      title: json['title'],
      author: json['author'],
    );
  }
}