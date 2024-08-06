import 'package:dart_playground/domain/shared/interfaces/identifiable.dart';
import 'package:dart_playground/domain/book/book_domain.dart';

class Book implements Identifiable {
  String id;
  String title;
  String desc;
  Collaborators collaboratos;
  CoverImage coverImage;
  ISBN isbn;
  Publishing publishing;
  Language lang;
  Price price;
  num? discounted;

  Book(this.id, this.title, this.desc, this.collaboratos, this.isbn, this.publishing, this.lang, this.price, this.coverImage, [this.discounted]);

  bool get isOnSale => discounted != null;
  bool get isTrial => id.toLowerCase().endsWith('trial');
  BookType get bookType => BookType.fromId(id);
}
