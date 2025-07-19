import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/mental_health_tips_provider.dart';
import '../providers/bookmarked_tips_provider.dart';

class MentalHealthTipsScreen extends ConsumerWidget {
  const MentalHealthTipsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tips = ref.watch(mentalHealthTipsProvider);
    final bookmarked = ref.watch(bookmarkedTipsProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Mental Health Tips'),
        centerTitle: true,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: tips.length,
        itemBuilder: (context, index) {
          final tip = tips[index];
          final isBookmarked = bookmarked.contains(index);

          return Card(
            margin: const EdgeInsets.only(bottom: 12),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            elevation: 4,
            child: ListTile(
              title: Text(tip),
              trailing: IconButton(
                icon: Icon(
                  isBookmarked ? Icons.favorite : Icons.favorite_border,
                  color: isBookmarked ? Colors.red : null,
                ),
                onPressed: () {
                  ref
                      .read(bookmarkedTipsProvider.notifier)
                      .toggleBookmark(index);
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
