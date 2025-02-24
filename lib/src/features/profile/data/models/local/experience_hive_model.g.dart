// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'experience_hive_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ExperienceHiveModelAdapter extends TypeAdapter<ExperienceHiveModel> {
  @override
  final int typeId = 5;

  @override
  ExperienceHiveModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ExperienceHiveModel(
      id: fields[0] as String,
      organization: fields[1] as String,
      degree: fields[2] as String,
      from: fields[3] as DateTime,
      to: fields[4] as DateTime,
    );
  }

  @override
  void write(BinaryWriter writer, ExperienceHiveModel obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.organization)
      ..writeByte(2)
      ..write(obj.degree)
      ..writeByte(3)
      ..write(obj.from)
      ..writeByte(4)
      ..write(obj.to);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ExperienceHiveModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
