import 'package:dart_playground/domain/book/book_domain.dart';
import 'package:dart_playground/domain/network/http_client.dart';
import 'package:dart_playground/infra/network/response_dto/book_response.dart';

final class MockEndpoint implements HttpClient {
  @override
  Future<List<Book>> request() async {
    // 模擬網絡延遲
    await Future.delayed(Duration(milliseconds: 500));

    // 這裡是模擬的 JSON 資料
    const jsonString = '''
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

    // 使用 BookResponseDTO 的靜態方法來解碼 JSON
    return BooksResponse.fromJson(jsonString).toDomain();
  }
}