import 'package:diary/providers/entry_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TextEditor extends ConsumerStatefulWidget {
  const TextEditor({super.key});

  @override
  ConsumerState<TextEditor> createState() => _TextEditorState();
}

class _TextEditorState extends ConsumerState<TextEditor> {
  final QuillController _controller = QuillController.basic();

  @override
  Widget build(BuildContext context) {
    _controller.document = Document()
      ..insert(0, ref.read(currentEntryProvider).body);

    return Column(
      children: [
        QuillSimpleToolbar(
          controller: _controller,
          config: const QuillSimpleToolbarConfig(),
        ),
        SizedBox(
          height: 12,
        ),
        Expanded(
          child: QuillEditor.basic(
            controller: _controller,
            config: const QuillEditorConfig(),
          ),
        ),
      ],
    );
  }
}
