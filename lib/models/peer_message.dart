import 'package:hive/hive.dart';

part 'peer_message.g.dart';

@HiveType(typeId: 0)
class PeerMessage {
  @HiveField(0)
  final String message;

  @HiveField(1)
  final DateTime timestamp;

  PeerMessage({
    required this.message,
    required this.timestamp,
  });
}
