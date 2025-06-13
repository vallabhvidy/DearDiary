int daysSinceEpoch(DateTime date) {
  final startOfDay = DateTime(date.year, date.month, date.day); // normalize
  return startOfDay.difference(DateTime.utc(1970, 1, 1)).inDays;
}

DateTime daysSinceEpochtoDateTime(int dse) {
  return DateTime.utc(1970, 1, 1).add(Duration(days: dse + 1));
}

DateTime initDate = DateTime(2000);
DateTime lastDate = DateTime(2101).subtract(Duration(days: 1));
