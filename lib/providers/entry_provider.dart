import 'package:diary/data/database/database.dart';
import 'package:diary/data/models/entry.dart';
import 'package:diary/utils/date.dart';
import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'entry_provider.g.dart';

@Riverpod(keepAlive: true)
class CurrentEntry extends _$CurrentEntry {
  @override
  Entry build() {
    debugPrint("currentEntryProvider rebuilding...");
    DateTime today = daysSinceEpochtoDateTime(daysSinceEpoch(DateTime.now()));
    String body = Store.get(daysSinceEpoch(today));

    return Entry(date: today, body: body);
  }

  Future<void> updateEntry(String body) async {
    debugPrint("updateEntry called for ${state.date}");
    state = Entry(
      date: state.date,
      body: body,
    );
    Store.update(daysSinceEpoch(state.date), body);
  }

  void switchEntry(DateTime date) {
    debugPrint("Switching to $date");
    state = Entry(date: date, body: Store.get(daysSinceEpoch(date)));
    debugPrint("Selected entry:- $date");
  }
}
