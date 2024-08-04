
import 'package:dart_playground/infra/network/endpoints/endpoints.dart';
import 'package:dart_playground/infra/network/http_client_services.dart';

final class MockHttpClient implements HttpClient {
  @override
  Future<String> request(EndPoint request, Map<String, dynamic> params) async {
    await Future.delayed(Duration(milliseconds: 500));

    switch (request) {
      case BookEndPoint.fetch_books:
      return '''
      {
        "data": [
          {
            "id": "T01_d8183330-5038-11ef-be2c-172d61aac479",
            "title": "The Dart Programming Language",
            "author": "Gilad Bracha"
          },
          {
            "id": "T02_138a5862-3628-4e99-95b4-4d1d982f542b",
            "title": "Flutter in Action",
            "author": "Eric Windmill"
          }
        ]
      }
      ''';
      default:
      throw 'Unknown EndPoint';
    }
  }
}