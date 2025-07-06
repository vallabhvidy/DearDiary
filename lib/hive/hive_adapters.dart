import 'package:hive_ce/hive.dart';
import 'package:diary/data/models/entry.dart';
import 'package:diary/data/models/settings.dart';

@GenerateAdapters([
  AdapterSpec<Entry>(),
  AdapterSpec<Settings>(),
])
part 'hive_adapters.g.dart';
