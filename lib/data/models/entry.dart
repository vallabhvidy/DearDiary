import 'package:hive_ce/hive.dart';

class Entry extends HiveObject {
  DateTime date;
  String body;
  String? imgPath;

  Entry({
    required this.date,
    required this.body,
    this.imgPath = "",
  });

  @override
  String toString() {
    super.toString();
    return '''\n
    date: $date,
    body: $body,
    ''';
  }
}
