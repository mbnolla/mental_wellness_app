import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/journal_provider.dart';
import '../models/journal_entry.dart';

class JournalScreen extends ConsumerStatefulWidget {
  const JournalScreen({super.key});

  @override
  ConsumerState<JournalScreen> createState() => _JournalScreenState();
}

class _JournalScreenState extends ConsumerState<JournalScreen> {
  final _titleController = TextEditingController();
  final _contentController = TextEditingController();

  @override
  void dispose() {
    _titleController.dispose();
    _contentController.dispose();
    super.dispose();
  }

  void _addEntry() {
    final title = _titleController.text.trim();
    final content = _contentController.text.trim();

    if (title.isEmpty || content.isEmpty) return;

    final newEntry = JournalEntry(
      title: title,
      content: content,
      createdAt: DateTime.now(),
    );

    ref.read(journalProvider.notifier).addEntry(newEntry);
    _titleController.clear();
    _contentController.clear();
  }

  @override
  Widget build(BuildContext context) {
    final entries = ref.watch(journalProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text("My Journal"),
      ),
      body: Column(
        children: [
          Expanded(
            child: entries.isEmpty
                ? const Center(child: Text("No journal entries yet."))
                : ListView.separated(
              itemCount: entries.length,
              separatorBuilder: (_, __) => Divider(),
              itemBuilder: (context, index) {
                final entry = entries[entries.length - 1 - index]; // show latest first
                return ListTile(
                  title: Text(entry.title),
                  subtitle: Text(entry.content),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete),
                    onPressed: () => ref
                        .read(journalProvider.notifier)
                        .deleteEntry(entries.length - 1 - index),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                TextField(
                  controller: _titleController,
                  decoration: const InputDecoration(
                    labelText: "Title",
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 10),
                TextField(
                  controller: _contentController,
                  maxLines: 4,
                  decoration: const InputDecoration(
                    labelText: "Content",
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 10),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton.icon(
                    onPressed: _addEntry,
                    icon: const Icon(Icons.add),
                    label: const Text("Add Journal Entry"),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
