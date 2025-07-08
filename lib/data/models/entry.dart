import 'package:hive_ce/hive.dart';

class Entry extends HiveObject {
  DateTime date;
  String body;
  String? imgPath;
  List<String>? imgPaths;

  Entry({
    required this.date,
    required this.body,
    this.imgPath = '',
    this.imgPaths = const [],
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
