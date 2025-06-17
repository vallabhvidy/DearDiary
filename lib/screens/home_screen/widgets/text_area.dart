import 'package:diary/providers/entry_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TextArea extends ConsumerStatefulWidget {
  const TextArea({super.key});

  @override
  ConsumerState<TextArea> createState() => _TextAreaState();
}

class _TextAreaState extends ConsumerState<TextArea> {
  _TextAreaState();

  late final TextEditingController _controller;

  @override
  void initState() {
    super.initState();

    _controller =
        TextEditingController(text: ref.read(currentEntryProvider).body);
  }

  @override
  void dispose() {
    super.dispose();

    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _controller.text = ref.read(currentEntryProvider).body;

    return TextField(
      controller: _controller,
      keyboardType: TextInputType.multiline,
      decoration: InputDecoration(
        border: InputBorder.none,
      ),
      style: TextStyle(
        color: Theme.of(context).colorScheme.onSurface,
        fontSize: 18.0,
        height: 1.5,
      ),
      maxLines: null,
      onChanged: ref.read(currentEntryProvider.notifier).updateEntry,
    );
  }
}
