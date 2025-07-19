import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';
import '../models/peer_message.dart';

final peerSupportProvider = StateNotifierProvider<PeerSupportNotifier, List<PeerMessage>>((ref) {
  return PeerSupportNotifier();
});

class PeerSupportNotifier extends StateNotifier<List<PeerMessage>> {
  PeerSupportNotifier() : super([]) {
    _loadMessages();
  }

  void _loadMessages() async {
    final box = Hive.box<PeerMessage>('peerSupportMessages');
    state = box.values.toList();
  }

  void sendMessage(String message) async {
    final box = Hive.box<PeerMessage>('peerSupportMessages');
    final newMessage = PeerMessage(message: message, timestamp: DateTime.now());
    await box.add(newMessage);
    state = [...state, newMessage];
  }
}
