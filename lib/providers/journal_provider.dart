import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';
import '../models/journal_entry.dart';

final journalProvider = StateNotifierProvider<JournalNotifier, List<JournalEntry>>((ref) {
  return JournalNotifier();
});

class JournalNotifier extends StateNotifier<List<JournalEntry>> {
  JournalNotifier() : super([]) {
    _loadEntries();
  }

  void _loadEntries() {
    final box = Hive.box<JournalEntry>('journalBox');
    state = box.values.toList().reversed.toList(); // latest first
  }

  void addEntry(JournalEntry entry) {
    final box = Hive.box<JournalEntry>('journalBox');
    box.add(entry);
    _loadEntries();
  }

  void deleteEntry(int index) {
    final box = Hive.box<JournalEntry>('journalBox');
    box.deleteAt(index);
    _loadEntries();
  }
}
