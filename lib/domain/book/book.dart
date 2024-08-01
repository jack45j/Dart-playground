import 'package:dart_playground/common/identifiable.dart';

class Book implements Identifiable {
  String id;
  String title;
  
  Book(this.id, this.title);
}