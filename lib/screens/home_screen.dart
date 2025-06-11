import 'package:diary/providers/entry_provider.dart';
import 'package:diary/utils/date.dart';
import 'package:diary/widgets/date_pill.dart';
import 'package:diary/widgets/text_area.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    DateTime date =
        ref.watch(currentEntryProvider.select((entry) => entry.date));

    debugPrint("Rebuilding home screen.");

    return Scaffold(
      appBar: AppBar(
        elevation: null,
        centerTitle: true,
        leading: DrawerButton(),
        title: ConstrainedBox(
          constraints: BoxConstraints(maxWidth: 600),
          child: Material(
            color: Theme.of(context).colorScheme.surfaceContainer,
            borderRadius: BorderRadius.circular(24.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  onPressed: !date
                          .subtract(const Duration(days: 1))
                          .isBefore(initDate)
                      ? () {
                          ref.read(currentEntryProvider.notifier).switchEntry(
                              date.subtract(const Duration(days: 1)));
                        }
                      : null,
                  icon: Icon(Icons.chevron_left),
                ),
                DatePill(
                  date: date,
                  onSelect: ref.read(currentEntryProvider.notifier).switchEntry,
                ),
                IconButton(
                  onPressed: !date
                          .add(const Duration(days: 1))
                          .isAfter(lastDate)
                      ? () {
                          ref
                              .read(currentEntryProvider.notifier)
                              .switchEntry(date.add(const Duration(days: 1)));
                        }
                      : null,
                  icon: Icon(Icons.chevron_right),
                ),
              ],
            ),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: CircleAvatar(),
          ),
        ],
      ),
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Container(
        padding: EdgeInsets.all(24.0),
        height: double.infinity,
        child: TextArea(),
      ),
    );
  }
}
