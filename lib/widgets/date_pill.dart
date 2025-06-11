import 'package:diary/utils/date.dart';
import 'package:flutter/material.dart';

class DatePill extends StatelessWidget {
  final DateTime date;
  final void Function(DateTime) onSelect;

  const DatePill({super.key, required this.date, required this.onSelect});

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(maxWidth: 150),
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
            "${date.day} - ${date.month} - ${date.year}",
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
