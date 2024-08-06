import 'package:dart_playground/common/identifiable.dart';
import 'package:dart_playground/domain/book/book_domain.dart';

enum CurrencyUnit {
  usd,
  twd,
  unknown;

  factory CurrencyUnit.from(String unit) {
    switch (unit.toUpperCase()) {
      case "USD":
        return CurrencyUnit.usd;
      default:
        return CurrencyUnit.unknown;
    }
  }
}

class Price {
  double amount;
  CurrencyUnit unit;

  Price(this.amount, this.unit);
}

class Book implements Identifiable {
  String id;
  String title;
  String author;
  Uri coverUrl;
  String isbn;
  String publisher;
  DateTime publishDate;
  String lang;
  Price price;
  String desc;

  Book._internal({
    required this.id,
    required this.title,
    required this.author,
    required this.coverUrl,
    required this.isbn,
    required this.publisher,
    required this.publishDate,
    required this.lang,
    required this.price,
    required this.desc,
  });

  static Book? create({
    required String id,
    required String title,
    required String author,
    required String coverUrl,
    required String isbn,
    required String publisher,
    required String publishDate,
    required String lang,
    required double amount,
    required String currency,
    required String desc,
  }) {
    Uri? parsedUrl = Uri.tryParse(coverUrl);
    DateTime? parsedDate = DateTime.tryParse(publishDate);

    if (parsedUrl == null || parsedDate == null) {
      return null;
    }

    return Book._internal(
      id: id,
      title: title,
      author: author,
      coverUrl: parsedUrl,
      isbn: isbn,
      publisher: publisher,
      publishDate: parsedDate,
      lang: lang,
      price: Price(amount, CurrencyUnit.from(currency)),
      desc: desc,
    );
  }

  BookType get bookType {
    if (id.length < 3) return BookType.unknown;

    switch (id.substring(0, 3)) {
      case 'T01':
        return BookType.book;
      case 'T02':
        return BookType.magazine;
      case 'T03':
        return BookType.audio;
      case 'T04':
        return BookType.video;
      default:
        return BookType.unknown;
    }
  }
}
