import 'package:diary/data/models/settings.dart';
import 'package:hive_ce/hive.dart';

class SettingsStore {
  static final String settingsHiveBox = 'settings';

  static Box get userBox => Hive.box<Settings>(settingsHiveBox);

  static Future<void> update(Settings settings) async {
    await userBox.put('settings', settings);
  }

  static Settings get() {
    return userBox.get('settings');
  }
}
