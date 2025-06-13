import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'navigation_provider.g.dart';

@riverpod
class SelectedIndex extends _$SelectedIndex {
  @override
  int build() => 0;

  void set(int selectedIndex) {
    debugPrint("switching page to $selectedIndex");
    state = selectedIndex;
  }
}
