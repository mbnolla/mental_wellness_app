// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'self_care_entry.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class SelfCareEntryAdapter extends TypeAdapter<SelfCareEntry> {
  @override
  final int typeId = 1;

  @override
  SelfCareEntry read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return SelfCareEntry(
      date: fields[0] as DateTime,
      completedTasks: (fields[1] as List).cast<String>(),
    );
  }

  @override
  void write(BinaryWriter writer, SelfCareEntry obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.date)
      ..writeByte(1)
      ..write(obj.completedTasks);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SelfCareEntryAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
