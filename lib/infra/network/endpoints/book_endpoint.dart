import 'package:dart_playground/infra/network/clients/http_client.dart';

enum BookEndPoint implements EndPoint {
  fetch_books;

  Map<String, String> get headers {
    return {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
    };
  }

  HttpRequestMethod get method {
    switch (this) {
      case BookEndPoint.fetch_books:
      return HttpRequestMethod.get;
    }
  }

  Uri get url {
    switch (this) {
      case BookEndPoint.fetch_books:
      return Uri(scheme: "https", host: 'some-url.com');
    }
  }
}