import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';
import '../models/mood_entry.dart';

final moodProvider = StateNotifierProvider<MoodNotifier, MoodEntry?>((ref) {
  return MoodNotifier();
});

class MoodNotifier extends StateNotifier<MoodEntry?> {
  MoodNotifier() : super(null);

  final _box = Hive.box<MoodEntry>('moods');

  void loadToday() {
    final today = DateTime.now();

    final todayEntry = _box.values.firstWhere(
          (e) => _isSameDay(e.date, today),
      orElse: () => MoodEntry(date: today, mood: '', note: ''),
    );

    // Optional: if empty mood/note means "not found", then set to null
    if (todayEntry.mood.isEmpty && todayEntry.note.isEmpty) {
      state = null;
    } else {
      state = todayEntry;
    }
  }

  void saveMood(String mood, String note) {
    final entry = MoodEntry(date: DateTime.now(), mood: mood, note: note);
    _box.put(entry.date.toIso8601String(), entry);
    state = entry;
  }

  bool _isSameDay(DateTime a, DateTime b) =>
      a.year == b.year && a.month == b.month && a.day == b.day;
}
