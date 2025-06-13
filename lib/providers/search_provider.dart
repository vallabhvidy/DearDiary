import 'package:diary/data/database/database.dart';
import 'package:diary/data/models/entry.dart';
import 'package:diary/utils/date.dart';
import 'package:flutter/rendering.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'search_provider.g.dart';

@riverpod
class Search extends _$Search {
  @override
  List<Entry> build() {
    return _allEntries();
  }

  List<Entry> _allEntries() {
    final entriesMap = Store.getAll();
    List<Entry> allEntries = [];
    entriesMap.forEach(
      (key, value) => allEntries.add(
        Entry(
          date: daysSinceEpochtoDateTime(key),
          body: value,
        ),
      ),
    );

    allEntries.sort((a, b) {
      int today = daysSinceEpoch(DateTime.now());
      int aToday = (daysSinceEpoch(a.date) - today).abs();
      int bToday = (daysSinceEpoch(b.date) - today).abs();

      return aToday.compareTo(bToday);
    });

    debugPrint(allEntries[0].date.toString());

    return allEntries;
  }

  void textSearch(String query) {
    final allEntries = _allEntries();
    final filteredEntries = allEntries
        .where((entry) => entry.body.toLowerCase().contains(query))
        .toList();

    state = filteredEntries;
  }
}
