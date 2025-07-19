import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';
import '../models/self_care_entry.dart';

final selfCareProvider = StateNotifierProvider<SelfCareNotifier, List<String>>((ref) {
  return SelfCareNotifier();
});

class SelfCareNotifier extends StateNotifier<List<String>> {
  SelfCareNotifier() : super([]);

  final _box = Hive.box<SelfCareEntry>('selfCare');

  void loadForToday() {
    final today = DateTime.now();
    final entry = _box.values.firstWhere(
          (e) => _isSameDay(e.date, today),
      orElse: () => SelfCareEntry(date: today, completedTasks: []),
    );
    state = entry.completedTasks;
  }

  void toggleTask(String task) {
    final today = DateTime.now();
    final currentTasks = [...state];

    if (currentTasks.contains(task)) {
      currentTasks.remove(task);
    } else {
      currentTasks.add(task);
    }

    state = currentTasks;

    _box.put(today.toIso8601String(), SelfCareEntry(date: today, completedTasks: currentTasks));
  }

  bool _isSameDay(DateTime a, DateTime b) =>
      a.year == b.year && a.month == b.month && a.day == b.day;
}
