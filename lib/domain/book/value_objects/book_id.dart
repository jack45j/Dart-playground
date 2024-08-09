import 'package:dart_playground/domain/shared/identifiable.dart';

class BookId implements Identifiable {
  final String id;

  BookId(this.id);
}