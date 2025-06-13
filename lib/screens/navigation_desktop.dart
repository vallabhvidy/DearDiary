import 'package:diary/providers/navigation_provider.dart';
import 'package:diary/screens/home_screen/home_screen.dart';
import 'package:diary/screens/search_screen/search_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class NavigationDesktop extends ConsumerWidget {
  const NavigationDesktop({super.key});

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
    final selectedIndex = ref.watch(selectedIndexProvider);
    debugPrint("current page:- $selectedIndex");

    return Row(
      children: [
        NavigationRail(
          destinations: destinations,
          selectedIndex: selectedIndex,
          onDestinationSelected: ref.read(selectedIndexProvider.notifier).set,
        ),
        const VerticalDivider(thickness: 1, width: 1),
        Expanded(
          child: IndexedStack(
            index: selectedIndex,
            children: screens,
          ),
        ),
      ],
    );
  }
}
