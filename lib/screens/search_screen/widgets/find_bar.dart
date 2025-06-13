import 'package:flutter/material.dart';

class FindBar extends StatelessWidget {
  const FindBar({super.key, required this.onChanged});

  final void Function(String) onChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40.0,
      constraints: BoxConstraints(maxWidth: 600),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surfaceContainer,
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: TextField(
        autofocus: true,
        onChanged: onChanged,
        decoration: InputDecoration(
          hintText: "Find your memories...",
          prefixIcon: Icon(Icons.search),
          border: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(vertical: 10.0),
        ),
      ),
    );
  }
}
