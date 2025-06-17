import 'package:diary/data/database/database.dart';
import 'package:diary/screens/navigation.dart';
import 'package:dynamic_color/dynamic_color.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();
  var box = await Hive.openBox(Store.userHiveBox);
  debugPrint("'${box.name}' box is open: ${box.isOpen}");
  debugPrint(Store.getAll().length.toString());

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
