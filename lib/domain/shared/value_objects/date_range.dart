class DateRange {
  final DateTime start;
  final DateTime end;

  DateRange(this.start, this.end) {
    if (end.isBefore(start)) {
      throw ArgumentError('End date cannot be before start date');
    }
  }

  bool includes(DateTime date) {
    return date.isAfter(start) && date.isBefore(end);
  }

  int get durationInDays => end.difference(start).inDays;
}