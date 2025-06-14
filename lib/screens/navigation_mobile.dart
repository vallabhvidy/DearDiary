import 'package:diary/providers/entry_provider.dart';
import 'package:diary/providers/navigation_provider.dart';
import 'package:diary/screens/home_screen/home_screen.dart';
import 'package:diary/screens/home_screen/widgets/date_switcher.dart';
import 'package:diary/screens/home_screen/widgets/home_container.dart';
import 'package:diary/screens/search_screen/search_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class NavigationMobile extends ConsumerWidget {
  const NavigationMobile({super.key});

  static final List<NavigationRailDestination> destinations = [
    NavigationRailDestination(icon: Icon(Icons.home), label: Text("Home")),
    NavigationRailDestination(icon: Icon(Icons.search), label: Text("Search")),
  ];

  static final List<Widget> screens = [
    HomeScreen(),
    SearchScreen(),
  ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final date = ref.watch(currentEntryProvider.select((entry) => entry.date));
    final selectedIndex = ref.watch(selectedIndexProvider);

    return Scaffold(
      appBar: AppBar(
        title: DateSwitcher(
          date: date,
          onSwitch: ref.read(currentEntryProvider.notifier).switchEntry,
        ),
        centerTitle: true,
      ),
      drawer: Drawer(
        child: NavigationRail(
          destinations: destinations,
          selectedIndex: selectedIndex,
          onDestinationSelected: (index) {
            ref.read(selectedIndexProvider.notifier).set(index);
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => screens[index]),
            );
          },
        ),
      ),
      body: HomeContainer(),
    );
  }
}
