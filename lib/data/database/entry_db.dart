import 'package:diary/data/models/entry.dart';
import 'package:diary/utils/date.dart';
import 'package:diary/utils/defaults.dart';
import 'package:flutter/material.dart';
import 'package:hive_ce/hive.dart';

class EntryStore {
  static final String userHiveBox = 'entries';

  static Box get userBox => Hive.box(userHiveBox);

  static Future<void> update(int key, Entry entry) async {
    String value = entry.body;

    if (value.replaceAll(RegExp(r'\s'), ' ').trim() == "" ||
        value.replaceAll(RegExp(r'\s'), ' ').trim().trim() ==
            defaultBody.replaceAll(RegExp(r'\s'), ' ').trim().trim()) {
      debugPrint("Value is empty skipping update (and deleting entry).");
      await userBox.delete(key);
      return;
    }
    debugPrint("Trying to update with key: $key");
    await userBox.put(key, entry);
    debugPrint("Saving entry with key $key and date ${entry.date}");
    debugPrint("All keys: ${userBox.keys}");
    debugPrint((userBox.get(key) == entry
        ? "Update successfull in database!"
        : "Update failed"));
  }

  static Entry get(int key) {
    Entry entry = userBox.get(
      key,
      defaultValue: Entry(
        date: daysSinceEpochtoDateTime(key),
        body: defaultBody,
      ),
    );

    return entry;
  }

  static Map<dynamic, dynamic> getAll() {
    return userBox.toMap();
  }
}
