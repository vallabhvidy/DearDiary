import 'dart:io';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class EntryCard extends StatelessWidget {
  const EntryCard({
    super.key,
    required this.date,
    required this.body,
    required this.onSelect,
    this.imgPath,
  });

  final DateTime date;
  final String body;
  final void Function(DateTime) onSelect;
  final String? imgPath;

  @override
  Widget build(BuildContext context) {
    debugPrint(imgPath);
    return InkWell(
      borderRadius: BorderRadius.circular(16.0),
      splashColor: Colors.transparent,
      onTap: () => onSelect(date),
      child: Card.outlined(
        elevation: 4,
        color: Theme.of(context).colorScheme.surface,
        margin: EdgeInsets.all(5.0),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (imgPath != null && imgPath != '')
                ClipRRect(
                  borderRadius: BorderRadius.circular(12.0),
                  child: Image.file(File(imgPath!), fit: BoxFit.cover),
                ),
              if (imgPath != null && imgPath != '')
                const SizedBox(height: 12,),
              Text(
                DateFormat.yMMMd().format(date),
                style: TextStyle(
                  fontSize: 15,
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
              SizedBox(height: 8.0),
              Text(
                body.replaceAll(RegExp(r'\s'), ' ').trim(),
                maxLines: 4,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: 15,
                  color: Theme.of(context).colorScheme.onSurface,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
