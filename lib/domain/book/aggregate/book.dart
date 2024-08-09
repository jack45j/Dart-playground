import 'package:dart_playground/domain/book/book_domain.dart';
import 'package:dart_playground/domain/shared/aggregate_root.dart';

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
  num? discounted;

  Book(this.uniqId, this.title, this.desc, this.collaboratos, this.isbn, this.publishing, this.lang, this.price, this.coverImage, [this.discounted]);

  bool get isOnSale => discounted != null;

  bool get isTrial => uniqId.id.toLowerCase().endsWith('trial');

  BookType get bookType => BookType.fromId(uniqId);
}
