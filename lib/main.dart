import 'dart:io';

import 'package:diary/data/database/entry_db.dart';
import 'package:diary/data/database/migrations.dart';
import 'package:diary/data/database/settings_db.dart';
import 'package:diary/hive/hive_registrar.g.dart';
import 'package:diary/screens/navigation.dart';
import 'package:dynamic_color/dynamic_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:hive_ce_flutter/hive_flutter.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  Hive
    ..init(Directory.current.path)
    ..registerAdapters();
  var entryBox = await Hive.openBox(EntryStore.userHiveBox);
  var settingsBox = await Hive.openBox(SettingsStore.settingsHiveBox);
  await migrate(entryBox, settingsBox);

  debugPrint("'${entryBox.name}' box is open: ${entryBox.isOpen}");
  debugPrint(EntryStore.getAll().length.toString());
  debugPrint("'${settingsBox.name}' box is open: ${settingsBox.isOpen}");

  runApp(const ProviderScope(child: MainApp()));
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  static final _defaultLight = ColorScheme.fromSeed(
    seedColor: Colors.purple,
    brightness: Brightness.light,
  );
  static final _defaultDark = ColorScheme.fromSeed(
    seedColor: Colors.purple,
    brightness: Brightness.dark,
  );

  @override
  Widget build(BuildContext context) {
    return DynamicColorBuilder(
      builder: (lightDynamic, darkDynamic) => MaterialApp(
        localizationsDelegates: const [FlutterQuillLocalizations.delegate],
        theme: ThemeData(
          colorScheme: lightDynamic ?? _defaultLight,
          useMaterial3: true,
        ),
        darkTheme: ThemeData(
          colorScheme: darkDynamic ?? _defaultDark,
          useMaterial3: true,
        ),
        themeMode: ThemeMode.system,
        home: Navigation(),
      ),
    );
  }
}
