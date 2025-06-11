class Entry {
  String body;
  DateTime date;

  Entry({required this.date, required this.body});

  @override
  String toString() {
    super.toString();
    return '''\n
    date: $date,
    body: $body,
    ''';
  }
}
