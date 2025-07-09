import 'dart:io';

import 'package:diary/providers/entry_provider.dart';
import 'package:diary/screens/home_screen/widgets/date_switcher.dart';
import 'package:diary/screens/home_screen/widgets/home_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final date = ref.watch(currentEntryProvider.select((entry) => entry.date));
    final image =
        ref.watch(currentEntryProvider.select((entry) => entry.imgPaths));

    debugPrint("Rebuilding home screen");
    debugPrint("Current entry date: $date");

    return CustomScrollView(
      slivers: [
        SliverAppBar(
          centerTitle: true,
          title: DateSwitcher(
            date: date,
            onSwitch: ref.read(currentEntryProvider.notifier).switchEntry,
          ),
        ),
        SliverToBoxAdapter(
          child: image!.isNotEmpty
              ? Image.file(
                  File(image[0]),
                  height: 200,
                )
              : const SizedBox.shrink(),
        ),
        SliverFillRemaining(
          hasScrollBody: false,
          child: HomeContainer(),
        ),
      ],
    );
  }
}
