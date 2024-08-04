// TODO: return String isn't a good practice

abstract class HttpClient {
  Future<String> request(EndPoint request, Map<String, dynamic> params);
}

enum HttpRequestMethod {
  get,
  post,
  put,
  delete,
  patch,
}

abstract class EndPoint {
  Map<String, String> get headers;
  HttpRequestMethod get method;
  Uri get url;
}