import 'package:hive/hive.dart';

part 'entry.g.dart';

@HiveType(typeId: 0)
class Entry {
  @HiveField(0)
  DateTime date;

  @HiveField(1)
  String body;

  @HiveField(2)
  String img;

  Entry({
    required this.date,
    required this.body,
    this.img = "",
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
