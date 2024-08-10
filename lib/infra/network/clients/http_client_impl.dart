import 'package:dart_playground/infra/network/endpoints/endpoints.dart';
import 'package:dart_playground/infra/network/http_client_services.dart';

final class MockHttpClient implements HttpClient {
  @override
  Future<String> request(EndPoint request, Map<String, dynamic> params) async {
    await Future.delayed(Duration(seconds: 1));

    switch (request) {
      case BookEndPoint.fetchBooks:
        return '''
      {
        "data": [
          {
            "id": "T01_d8183330-5038-11ef-be2c-172d61aac479",
            "title": "The Dart Programming Language",
            "author": "Gilad Bracha",
            "cover_url": "https://placehold.co/154x216.png",
            "isbn": "978-0321927705",
            "publisher": "Addison-Wesley Professional",
            "publication_date": "2015-06-27",
            "language": "English",
            "price": 49.99,
            "currency": "USD",
            "description": "A comprehensive guide to the Dart programming language, covering its syntax, semantics, and core libraries."
          },
          {
            "id": "T04_138a5862-3628-4e99-95b4-4d1d982f542b",
            "title": "Flutter in Action",
            "author": "Eric Windmill",
            "cover_url": "https://placehold.co/154x216.png",
            "isbn": "978-1617296147",
            "publisher": "Manning Publications",
            "publication_date": "2020-01-07",
            "language": "English",
            "price": 39.99,
            "currency": "USD",
            "description": "A practical guide to building high-performance cross-platform mobile applications with Flutter."
          },
          {
            "id": "T02_7c9e6754-1d2f-4f3a-8c5b-9b7a8b6d3e2f",
            "title": "Effective Dart",
            "author": "Kathy Walrath",
            "cover_url": "https://placehold.co/154x216.png",
            "isbn": "978-1234567890",
            "publisher": "O'Reilly Media",
            "publication_date": "2019-03-15",
            "language": "English",
            "price": 44.99,
            "currency": "USD",
            "description": "Learn best practices and guidelines for writing clean, efficient, and idiomatic Dart code."
          },
          {
            "id": "T01_3f5d9a2e-7b8c-4d1e-9a6f-2b5c8d7e4f3a",
            "title": "Dart: Up and Running",
            "author": "Kathy Walrath & Seth Ladd",
            "cover_url": "https://placehold.co/154x216.png",
            "isbn": "978-1449330897",
            "publisher": "O'Reilly Media",
            "publication_date": "2012-03-07",
            "language": "English",
            "price": 29.99,
            "currency": "USD",
            "description": "A concise introduction to Dart, covering the essentials you need to start developing with this powerful language."
          },
          {
            "id": "T01_9a8b7c6d-5e4f-3g2h-1i0j-9k8l7m6n5o",
            "title": "Flutter Apprentice",
            "author": "Michael Katz",
            "cover_url": "https://placehold.co/154x216.png",
            "isbn": "978-1950325641",
            "publisher": "Razeware LLC",
            "publication_date": "2021-10-05",
            "language": "English",
            "price": 59.99,
            "currency": "USD",
            "description": "Learn to build beautiful, fast, and native-quality apps with Flutter, Google's mobile SDK for iOS and Android."
          },
          {
            "id": "T03_2p3o4i5u-6y7t8r9e-0w1q2s3d-4f5g6h7j",
            "title": "Dart Cookbook",
            "author": "Ivo Balbaert",
            "cover_url": "https://placehold.co/154x216.png",
            "isbn": "978-1783989621",
            "publisher": "Packt Publishing",
            "publication_date": "2014-10-28",
            "language": "English",
            "price": 34.99,
            "promotions": ["XMAS24"],
            "currency": "USD",
            "description": "Over 60 practical recipes for building web and mobile applications with Dart, covering a wide range of topics."
          },
          {
            "id": "T02_8k9j0h1g-2f3d4s5a-6q7w8e9r-0t1y2u3i",
            "title": "Programming Flutter",
            "author": "Carmine Zaccagnino",
            "cover_url": "https://placehold.co/154x216.png",
            "isbn": "978-1680506952",
            "publisher": "Pragmatic Bookshelf",
            "publication_date": "2020-10-13",
            "language": "English",
            "price": 55.95,
            "currency": "USD",
            "description": "A comprehensive guide to building native cross-platform apps with Flutter, from setup to deployment and everything in between."
          },
          {
            "id": "T04_4o5p6l7k-8j9h0g1f-2d3s4a5q-6w7e8r9t",
            "title": "Learning Dart",
            "author": "Dzenan Ridjanovic & Ivo Balbaert",
            "cover_url": "https://placehold.co/154x216.png",
            "isbn": "978-1849697422",
            "publisher": "Packt Publishing",
            "publication_date": "2013-12-24",
            "language": "English",
            "price": 39.99,
            "currency": "USD",
            "description": "A practical, hands-on guide that provides you with clear, step-by-step exercises for learning Dart, the new programming language for the web."
          }
        ]
      }
      ''';
      default:
        throw 'Unknown EndPoint';
    }
  }
}
