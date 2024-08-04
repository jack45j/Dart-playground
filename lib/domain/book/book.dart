import 'package:dart_playground/common/identifiable.dart';
import 'package:dart_playground/domain/book/book_domain.dart';

class Book implements Identifiable {
  String id;
  String title;
  
  Book(this.id, this.title);

  BookType get bookType {
    if (id.length < 3) return BookType.unknown;
    
    switch (id.substring(0, 3)) {
      case 'T01':
        return BookType.book;
      case 'T02':
        return BookType.magazine;
      default:
        return BookType.unknown;
    }
  }
}

