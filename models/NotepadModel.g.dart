// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'NotepadModel.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class NotepadModelAdapter extends TypeAdapter<NotepadModel> {
  @override
  final int typeId = 0;

  @override
  NotepadModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return NotepadModel(
      title: fields[0] as String,
      description: fields[1] as String,
    );
  }

  @override
  void write(BinaryWriter writer, NotepadModel obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.title)
      ..writeByte(1)
      ..write(obj.description);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is NotepadModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
