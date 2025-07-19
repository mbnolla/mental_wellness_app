import 'dart:math';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'mental_health_tips_provider.dart';

final randomTipProvider = Provider<String>((ref) {
  final tips = ref.watch(mentalHealthTipsProvider);
  final today = DateTime.now();
  final seed = int.parse("${today.year}${today.month}${today.day}");
  final rng = Random(seed);
  return tips[rng.nextInt(tips.length)];
});
