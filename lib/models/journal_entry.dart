import 'package:hive/hive.dart';

part 'journal_entry.g.dart';

@HiveType(typeId: 0)
class JournalEntry {
  @HiveField(0)
  final String title;

  @HiveField(1)
  final String content;

  @HiveField(2)
  final DateTime createdAt;

  JournalEntry({
    required this.title,
    required this.content,
    required this.createdAt,
  });
}
