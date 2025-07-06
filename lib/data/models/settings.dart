import 'package:hive_ce/hive.dart';

class Settings extends HiveObject {
  int entryDbVersion;

  Settings({this.entryDbVersion = 1});
}
