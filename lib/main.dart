import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:path_provider/path_provider.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:firebase_core/firebase_core.dart';


import 'models/journal_entry.dart';
import 'models/self_care_entry.dart';
import 'models/mood_entry.dart';
import 'models/peer_message.dart';

import 'screens/home_screen.dart';
import 'providers/theme_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize Firebase with generated options
  await Firebase.initializeApp();

  await Hive.initFlutter();

  // Register Hive adapters
  Hive.registerAdapter(JournalEntryAdapter());
  Hive.registerAdapter(SelfCareEntryAdapter());
  Hive.registerAdapter(MoodEntryAdapter());
  Hive.registerAdapter(PeerMessageAdapter());

  // Open Hive boxes
  await Hive.openBox<JournalEntry>('journalBox');
  await Hive.openBox<MoodEntry>('moods');
  await Hive.openBox<SelfCareEntry>('selfCare');
  await Hive.openBox<PeerMessage>('peer_messages');

  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode = ref.watch(themeProvider);

    return MaterialApp(
      title: 'Mental Wellness App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(useMaterial3: true),
      darkTheme: ThemeData.dark(useMaterial3: true),
      themeMode: themeMode,
      home: const HomeScreen(),
    );
  }
}
