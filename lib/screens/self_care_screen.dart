import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/self_care_provider.dart';
import '../providers/mood_provider.dart';

final tasks = ["Drink Water", "Walk Outside", "Stretch", "Meditate"];

class SelfCareScreen extends ConsumerWidget {
  const SelfCareScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedTasks = ref.watch(selfCareProvider);
    final mood = ref.watch(moodProvider);

    return Scaffold(
      appBar: AppBar(title: Text("Self-Care & Mood")),
      body: ListView(
        padding: EdgeInsets.all(16),
        children: [
          Text("Self-Care Tasks", style: Theme.of(context).textTheme.titleLarge),
          ...tasks.map((task) => CheckboxListTile(
            title: Text(task),
            value: selectedTasks.contains(task),
            onChanged: (_) => ref.read(selfCareProvider.notifier).toggleTask(task),
          )),
          Divider(),
          Text("Today's Mood", style: Theme.of(context).textTheme.titleLarge),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: ["happy", "neutral", "sad"].map((m) {
              return IconButton(
                icon: Icon(
                  m == "happy"
                      ? Icons.sentiment_satisfied_alt
                      : m == "neutral"
                      ? Icons.sentiment_neutral
                      : Icons.sentiment_dissatisfied,
                  color: mood?.mood == m ? Colors.blue : Colors.grey,
                  size: 36,
                ),
                onPressed: () {
                  ref.read(moodProvider.notifier).saveMood(m, "");
                },
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
