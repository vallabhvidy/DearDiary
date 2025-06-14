import 'package:diary/providers/entry_provider.dart';
import 'package:diary/providers/navigation_provider.dart';
import 'package:diary/providers/search_provider.dart';
import 'package:diary/screens/search_screen/widgets/entry_card.dart';
import 'package:diary/screens/search_screen/widgets/find_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class SearchScreen extends ConsumerWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final searchList = ref.watch(searchProvider);
    final dateSwitch = ref.read(currentEntryProvider.notifier).switchEntry;
    final navigation = ref.read(selectedIndexProvider.notifier);

    debugPrint("items in search: ${searchList.length}");

    onSelect(date) {
      navigation.set(0);
      dateSwitch(date);
    }

    var screenWidth = MediaQuery.sizeOf(context).width;
    var screenHeight = MediaQuery.sizeOf(context).height;

    var crossAxisCount = screenWidth < 600
        ? 2
        : screenWidth < 1200
            ? 3
            : 4;

    debugPrint("$screenHeight : $screenWidth");

    return CustomScrollView(
      slivers: [
        SliverAppBar(
          floating: true,
          title: FindBar(
            onChanged: ref.read(searchProvider.notifier).textSearch,
          ),
          centerTitle: true,
        ),
        SliverMasonryGrid.count(
          crossAxisCount: crossAxisCount,
          childCount: searchList.length,
          itemBuilder: (context, index) => EntryCard(
            date: searchList[index].date,
            body: searchList[index].body,
            onSelect: onSelect,
          ),
        ),
      ],
    );
  }
}
