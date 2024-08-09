// When some different sort options have the same title, it will become a huge trouble if uses enumerate here.
abstract class SortOption<T> {
  final int Function(T a, T b) sortBy;
  final String sortOptionTitle;
  
  SortOption({
    required this.sortBy,
    required this.sortOptionTitle,
  });
}