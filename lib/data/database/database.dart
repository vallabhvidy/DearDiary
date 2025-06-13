import 'package:diary/utils/defaults.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

class Store {
  static final String userHiveBox = 'entries';

  static Box get userBox => Hive.box(userHiveBox);

  static Future<void> update(int key, String value) async {
    if (value == "" || value == defaultBody) {
      debugPrint("Value is empty skipping update.");
      return;
    }
    debugPrint("Trying to update with key: $key");
    await userBox.put(key, value);
    debugPrint((userBox.get(key) == value
        ? "Update successfull in database!"
        : "Update failed"));
  }

  static String get(int key) {
    String body = userBox.get(
      key,
      defaultValue: defaultBody,
    );
    return body;
  }

  static Map<dynamic, dynamic> getAll() {
    return userBox.toMap();
  }
}
