import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/peer_support_provider.dart';
import '../models/peer_message.dart';
import 'package:intl/intl.dart';

class PeerSupportChatScreen extends ConsumerStatefulWidget {
  const PeerSupportChatScreen({super.key});

  @override
  ConsumerState<PeerSupportChatScreen> createState() => _PeerSupportChatScreenState();
}

class _PeerSupportChatScreenState extends ConsumerState<PeerSupportChatScreen> {
  final _controller = TextEditingController();

  void _send() {
    final text = _controller.text.trim();
    if (text.isNotEmpty) {
      ref.read(peerSupportProvider.notifier).sendMessage(text);
      _controller.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    final messages = ref.watch(peerSupportProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Anonymous Peer Support'),
      ),
      body: Column(
        children: [
          Expanded(
            child: messages.isEmpty
                ? const Center(child: Text('No messages yet.'))
                : ListView.builder(
              padding: const EdgeInsets.all(10),
              itemCount: messages.length,
              itemBuilder: (context, index) {
                final msg = messages[index];
                final time = DateFormat('hh:mm a').format(msg.timestamp);
                return ListTile(
                  title: Text(msg.message),
                  subtitle: Text('Anonymous • $time'),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: const InputDecoration(
                      hintText: 'Enter your message',
                    ),
                    onSubmitted: (_) => _send(),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.send),
                  onPressed: _send,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
