// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dart_playground/domain/book/book_domain.dart';
import 'package:dart_playground/domain/shared/shared.dart';

class Book implements AggregateRoot {
  BookId uniqId;
  String title;
  String desc;
  Collaborators collaboratos;
  CoverImage coverImage;
  ISBN isbn;
  Publishing publishing;
  Language lang;
  Price price;
  List<PromotionCode> promotions;
  
  Book({
    required this.uniqId,
    required this.title,
    required this.desc,
    required this.collaboratos,
    required this.coverImage,
    required this.isbn,
    required this.publishing,
    required this.lang,
    required this.price,
    required this.promotions,
  });

  bool get isHasPromot => !promotions.isEmpty;

  bool get isTrial => uniqId.id.toLowerCase().endsWith('trial');

  BookType get bookType => BookType.fromId(uniqId);
}
