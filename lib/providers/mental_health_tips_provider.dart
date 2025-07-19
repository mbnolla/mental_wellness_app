// lib/providers/mental_health_tips_provider.dart
import 'package:flutter_riverpod/flutter_riverpod.dart';

final mentalHealthTipsProvider = Provider<List<String>>((ref) {
  return [
    "Take a 10-minute walk to clear your mind.",
    "Write down three things you're grateful for.",
    "Talk to a friend or loved one today.",
    "Drink water and get enough sleep.",
    "Practice deep breathing for 5 minutes.",
    "Avoid screen time 1 hour before bed.",
    "Listen to your favorite music or podcast.",
  ];
});
