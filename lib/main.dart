import 'package:diary/data/database/database.dart';
import 'package:diary/screens/navigation_desktop.dart';
import 'package:dynamic_color/dynamic_color.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();
  var box = await Hive.openBox(Store.userHiveBox);
  debugPrint("Box '${box.name}' is open: ${box.isOpen}");

  runApp(const ProviderScope(child: MainApp()));
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return DynamicColorBuilder(
      builder: (lightDynamic, darkDynamic) => MaterialApp(
        theme: ThemeData(colorScheme: lightDynamic, useMaterial3: true),
        darkTheme: ThemeData(
          colorScheme: darkDynamic,
          useMaterial3: true,
        ),
        themeMode: ThemeMode.system,
        home: NavigationDesktop(),
      ),
    );
  }
}
