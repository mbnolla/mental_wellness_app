import 'package:hive/hive.dart';

part 'mood_entry.g.dart';

@HiveType(typeId: 2)
class MoodEntry {
  @HiveField(0)
  final DateTime date;

  @HiveField(1)
  final String mood; // "happy", "neutral", "sad"

  @HiveField(2)
  final String note;

  MoodEntry({
    required this.date,
    required this.mood,
    required this.note,
  });
}
