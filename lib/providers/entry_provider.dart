import 'package:diary/data/database/database.dart';
import 'package:diary/data/models/entry.dart';
import 'package:diary/utils/date.dart';
import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'entry_provider.g.dart';

@riverpod
class CurrentEntry extends _$CurrentEntry {
  @override
  Entry build() {
    DateTime today = DateTime.now();
    String body = Store.get(daysSinceEpoch(today));

    return Entry(date: today, body: body);
  }

  Future<void> updateEntry(String body) async {
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
