import 'package:diary/providers/navigation_provider.dart';
import 'package:diary/screens/home_screen/home_screen.dart';
import 'package:diary/screens/home_screen/widgets/home_fab.dart';
import 'package:diary/screens/search_screen/search_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_expandable_fab/flutter_expandable_fab.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Navigation extends ConsumerWidget {
  const Navigation({super.key});

  static final List<Widget> screens = [
    HomeScreen(),
    SearchScreen(),
  ];

  static final List<Widget> fabs = [
    HomeFAB(),
    ExpandableFab(children: []),
  ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedIndex = ref.watch(selectedIndexProvider);
    debugPrint("current page:- $selectedIndex");

    var screenWidth = MediaQuery.sizeOf(context).width;

    if (screenWidth > 600) {
      final List<NavigationRailDestination> destinations = [
        NavigationRailDestination(
          icon: Icon(Icons.home),
          label: Text("Home"),
          padding: EdgeInsets.all(8.0),
        ),
        NavigationRailDestination(
          icon: Icon(Icons.search),
          label: Text("Search"),
          padding: EdgeInsets.all(8.0),
        ),
      ];

      return Scaffold(
        body: Row(
          children: [
            NavigationRail(
              destinations: destinations,
              selectedIndex: selectedIndex,
              labelType: NavigationRailLabelType.all,
              onDestinationSelected:
                  ref.read(selectedIndexProvider.notifier).set,
            ),
            const VerticalDivider(thickness: 1, width: 1),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: screens[selectedIndex],
              ),
            ),
          ],
        ),
        floatingActionButtonLocation: ExpandableFab.location,
        floatingActionButton: fabs[selectedIndex],
      );
    } else {
      final List<Widget> destinations = [
        NavigationDestination(icon: Icon(Icons.home), label: "Home"),
        NavigationDestination(icon: Icon(Icons.search), label: "Search"),
      ];

      return Scaffold(
        bottomNavigationBar: NavigationBar(
          destinations: destinations,
          selectedIndex: selectedIndex,
          onDestinationSelected: ref.read(selectedIndexProvider.notifier).set,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: screens[selectedIndex],
        ),
        floatingActionButtonLocation: ExpandableFab.location,
        floatingActionButton: fabs[selectedIndex],
      );
    }
  }
}
