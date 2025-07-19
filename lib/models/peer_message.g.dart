// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'peer_message.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PeerMessageAdapter extends TypeAdapter<PeerMessage> {
  @override
  final int typeId = 2;

  @override
  PeerMessage read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return PeerMessage(
      message: fields[0] as String,
      timestamp: fields[1] as DateTime,
    );
  }

  @override
  void write(BinaryWriter writer, PeerMessage obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.message)
      ..writeByte(1)
      ..write(obj.timestamp);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PeerMessageAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
