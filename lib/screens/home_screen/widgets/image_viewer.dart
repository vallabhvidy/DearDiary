import 'package:flutter/material.dart';

class ImageViewer extends StatelessWidget {
  final List<String>? imgPaths;
  final int current;

  const ImageViewer({super.key, required this.imgPaths, this.current = 0});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
