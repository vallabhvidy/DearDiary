import 'package:diary/utils/date.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

class DateSwitcher extends ConsumerWidget {
  const DateSwitcher({
    super.key,
    required this.date,
    required this.onSwitch,
  });

  final DateTime date;
  final void Function(DateTime) onSwitch;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ConstrainedBox(
      constraints: BoxConstraints(maxWidth: 600),
      child: Material(
        color: Theme.of(context).colorScheme.onInverseSurface,
        borderRadius: BorderRadius.circular(24.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              onPressed:
                  !date.subtract(const Duration(days: 1)).isBefore(initDate)
                      ? () {
                          onSwitch(date.subtract(const Duration(days: 1)));
                        }
                      : null,
              icon: Icon(Icons.chevron_left),
            ),
            DatePill(
              date: date,
              onSelect: onSwitch,
            ),
            IconButton(
              onPressed: !date.add(const Duration(days: 1)).isAfter(lastDate)
                  ? () {
                      onSwitch(date.add(const Duration(days: 1)));
                    }
                  : null,
              icon: Icon(Icons.chevron_right),
            ),
          ],
        ),
      ),
    );
  }
}

class DatePill extends StatelessWidget {
  final DateTime date;
  final void Function(DateTime) onSelect;

  const DatePill({super.key, required this.date, required this.onSelect});

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(maxWidth: 200),
      child: InkWell(
        onTap: () async {
          final newDate = await showDatePicker(
            context: context,
            initialDate: date,
            firstDate: initDate,
            lastDate: lastDate,
          );
          debugPrint("selected:- $newDate");
          if (newDate != null) onSelect(newDate);
        },
        borderRadius: BorderRadius.circular(24.0),
        hoverColor: Theme.of(context).colorScheme.surfaceContainerHighest,
        child: Container(
          height: 40.0,
          decoration: BoxDecoration(
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(24.0),
          ),
          alignment: Alignment.center,
          child: Text(
            DateFormat.yMMMMd().format(date),
            style: TextStyle(
              color: Theme.of(context).colorScheme.onSurface,
              fontSize: 16.0,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}
