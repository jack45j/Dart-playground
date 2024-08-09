// When some different filter options have the same title, it will become a huge trouble if uses enumerate here.
abstract class FilterOption<T> {
  final bool Function(T a) filterBy;
  final String filterOptionTitle;
  
  FilterOption({
    required this.filterBy,
    required this.filterOptionTitle,
  });
}