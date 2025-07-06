import 'package:diary/data/models/entry.dart';
import 'package:diary/data/models/settings.dart';
import 'package:diary/utils/date.dart';
import 'package:hive_ce/hive.dart';

Future<void> migrate(Box entryBox, Box settingsBox) async {
  final settings = settingsBox.get('settings') ?? Settings();
  final version = settings.entryDbVersion;

  if (version < 2) {
    for (final key in entryBox.keys) {
      final val = entryBox.get(key);
      if (val is Entry) {
        if (val.imgPath == null) {
          val.imgPath = '';
          await entryBox.put(key, val);
        }
      } else if (val is String) {
        final e =
            Entry(date: daysSinceEpochtoDateTime(key), body: val, imgPath: '');
        await entryBox.put(key, e);
      }
    }

    settings.entryDbVersion = 2;
    await settingsBox.put('settings', settings);
  }
}
