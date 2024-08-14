// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'taskModel.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class taskModelAdapter extends TypeAdapter<taskModel> {
  @override
  final int typeId = 0;

  @override
  taskModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return taskModel(
      title: fields[0] as String?,
      description: fields[1] as String?,
      status: fields[2] as String?,
      tags: (fields[3] as List).cast<String>(),
      ID: fields[4] as String?,
      startdatetime: fields[5] as String?,
      enddatetime: fields[6] as String?,
      tasktype: fields[7] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, taskModel obj) {
    writer
      ..writeByte(8)
      ..writeByte(0)
      ..write(obj.title)
      ..writeByte(1)
      ..write(obj.description)
      ..writeByte(2)
      ..write(obj.status)
      ..writeByte(3)
      ..write(obj.tags)
      ..writeByte(4)
      ..write(obj.ID)
      ..writeByte(5)
      ..write(obj.startdatetime)
      ..writeByte(6)
      ..write(obj.enddatetime)
      ..writeByte(7)
      ..write(obj.tasktype);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is taskModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
