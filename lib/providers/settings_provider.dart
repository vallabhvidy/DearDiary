import 'package:diary/data/database/settings_db.dart';
import 'package:diary/data/models/settings.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'settings_provider.g.dart';

@Riverpod(keepAlive: true)
class AppSettings extends _$AppSettings {
  @override
  Settings build() => SettingsStore.get();
}
