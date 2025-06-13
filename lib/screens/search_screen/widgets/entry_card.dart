import 'package:flutter/material.dart';

class EntryCard extends StatelessWidget {
  const EntryCard({
    super.key,
    required this.date,
    required this.body,
    required this.onSelect,
  });

  final DateTime date;
  final String body;
  final void Function(DateTime) onSelect;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onSelect(date),
      child: Card.outlined(
        color: Colors.transparent,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            // Date
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Text("${date.day} - ${date.month} - ${date.year}"),
            ),

            SizedBox(height: 8.0),

            // Body
            Text(
              body,
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}
