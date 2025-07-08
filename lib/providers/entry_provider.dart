import 'package:diary/data/database/entry_db.dart';
import 'package:diary/data/models/entry.dart';
import 'package:diary/utils/date.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'entry_provider.g.dart';

@Riverpod(keepAlive: true)
class CurrentEntry extends _$CurrentEntry {
  @override
  Entry build() {
    debugPrint("currentEntryProvider rebuilding...");
    DateTime today = daysSinceEpochtoDateTime(daysSinceEpoch(DateTime.now()));
    Entry entry = EntryStore.get(daysSinceEpoch(today));

    return entry;
  }

  Future<void> updateEntry(String body) async {
    debugPrint("updateEntry called for ${state.date}");
    state = Entry(
      date: state.date,
      body: body,
      imgPaths: state.imgPaths,
    );
    EntryStore.update(daysSinceEpoch(state.date), state);
  }

  void switchEntry(DateTime date) {
    debugPrint("Switching to $date");
    state = EntryStore.get(daysSinceEpoch(date));
    debugPrint("Selected entry:- $date");
  }

  void addImage() async {
    debugPrint("adding image to your entry...");
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (image != null) {
      debugPrint("Image selected:- ${image.name}");
      state = Entry(
        date: state.date,
        body: state.body,
        imgPaths: state.imgPaths! + ([image.path]),
      );
    } else {
      debugPrint("No image selected");
    }
  }
}
