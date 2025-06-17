import 'package:diary/data/database/database.dart';
import 'package:diary/data/models/entry.dart';
import 'package:diary/utils/date.dart';
import 'package:flutter/rendering.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'search_provider.g.dart';

@riverpod
class Search extends _$Search {
  @override
  List<Entry> build() => _allEntries();

  List<Entry> _allEntries() {
    debugPrint("fetching all entries...");
    final entriesMap = Store.getAll();
    debugPrint("converting entries map to list...");
    List<Entry> allEntries = [];
    entriesMap.forEach(
      (key, value) => allEntries.add(
        Entry(
          date: daysSinceEpochtoDateTime(key),
          body: value,
        ),
      ),
    );

    debugPrint("conversion successfull!");
    debugPrint("Total number of entries:- ${allEntries.length}");

    if (allEntries.isEmpty) {
      debugPrint("skipping sort as list empty...");
      return [];
    }

    debugPrint("Sorting...");

    allEntries.sort((a, b) {
      int today = daysSinceEpoch(DateTime.now());
      int aToday = (daysSinceEpoch(a.date) - today).abs();
      int bToday = (daysSinceEpoch(b.date) - today).abs();

      return aToday.compareTo(bToday);
    });

    debugPrint("Sorting successfull!");
    debugPrint("initial entry:- ${allEntries[0].date}");

    return allEntries;
  }

  void textSearch(String query) {
    debugPrint("filtering with query: $query");
    final allEntries = _allEntries();
    final filteredEntries = allEntries
        .where((entry) => entry.body.toLowerCase().contains(query))
        .toList();

    state = filteredEntries;
  }
}
