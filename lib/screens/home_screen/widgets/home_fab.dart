import 'package:diary/providers/entry_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_expandable_fab/flutter_expandable_fab.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeFAB extends ConsumerWidget {
  const HomeFAB({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ExpandableFab(
      type: ExpandableFabType.up,
      openButtonBuilder: DefaultFloatingActionButtonBuilder(
        child: const Icon(Icons.add),
        fabSize: ExpandableFabSize.regular,
        shape: const CircleBorder(),
      ),
      distance: 70,
      children: [
        FloatingActionButton.extended(
          heroTag: null,
          label: Text("Image"),
          icon: Icon(Icons.image),
          onPressed: ref.read(currentEntryProvider.notifier).addImage,
        ),
      ],
    );
  }
}
