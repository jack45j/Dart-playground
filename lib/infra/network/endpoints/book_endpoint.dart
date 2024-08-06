import 'package:dart_playground/infra/network/clients/http_client.dart';

enum BookEndPoint implements EndPoint {
  fetchBooks;

  Map<String, String> get headers {
    return {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
    };
  }

  HttpRequestMethod get method {
    switch (this) {
      case BookEndPoint.fetchBooks:
      return HttpRequestMethod.get;
    }
  }

  Uri get url {
    switch (this) {
      case BookEndPoint.fetchBooks:
      return Uri(scheme: "https", host: 'some-url.com');
    }
  }
}