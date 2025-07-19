import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/theme_provider.dart';
import '../providers/daily_tip_provider.dart';
import 'journal_screen.dart';
import 'mental_health_tips_screen.dart';
import 'self_care_screen.dart';
import 'peer_support_chatscreen.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  bool _hasShownPopup = false;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!_hasShownPopup) {
        _showDailyTipPopup();
        _hasShownPopup = true;
      }
    });
  }

  void _showDailyTipPopup() {
    final tip = ref.read(randomTipProvider);
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text("🌞 Daily Mental Health Tip"),
        content: Text(tip),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("Got it"),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = ref.watch(themeProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Wellness Dashboard"),
        actions: [
          PopupMenuButton<ThemeMode>(
            icon: const Icon(Icons.color_lens),
            onSelected: (mode) =>
                ref.read(themeProvider.notifier).setTheme(mode),
            itemBuilder: (_) => const [
              PopupMenuItem(value: ThemeMode.light, child: Text('Light')),
              PopupMenuItem(value: ThemeMode.dark, child: Text('Dark')),
              PopupMenuItem(value: ThemeMode.system, child: Text('System')),
            ],
          ),
        ],
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Card(
                elevation: 4,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: const [
                      Text(
                        'Welcome to the Mental Wellness App',
                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 8),
                      Text(
                        'Track your well-being, journal your thoughts, and stay mentally strong.',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 14, color: Colors.grey),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 30),
              _buildHomeButton(
                context,
                icon: Icons.book,
                label: "Open Journal",
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => const JournalScreen()),
                  );
                },
              ),
              const SizedBox(height: 12),
              _buildHomeButton(
                context,
                icon: Icons.health_and_safety,
                label: "View Mental Health Tips",
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => const MentalHealthTipsScreen()),
                  );
                },
              ),
              const SizedBox(height: 12),
              _buildHomeButton(
                context,
                icon: Icons.chat_bubble_outline,
                label: "Peer Support Chat",
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => const PeerSupportChatScreen()),
                  );
                },
              ),

              const SizedBox(height: 12),
              _buildHomeButton(
                context,
                icon: Icons.spa,
                label: "Self-Care Tracker",
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => const SelfCareScreen()),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHomeButton(BuildContext context,
      {required IconData icon,
        required String label,
        required VoidCallback onPressed}) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton.icon(
        icon: Icon(icon, size: 22),
        label: Padding(
          padding: const EdgeInsets.symmetric(vertical: 14.0),
          child: Text(label, style: const TextStyle(fontSize: 16)),
        ),
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          backgroundColor: Theme.of(context).colorScheme.primary,
          foregroundColor: Colors.white,
        ),
        onPressed: onPressed,
      ),
    );
  }
}
