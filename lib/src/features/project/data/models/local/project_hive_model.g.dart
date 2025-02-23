// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'project_hive_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ProjectHiveModelAdapter extends TypeAdapter<ProjectHiveModel> {
  @override
  final int typeId = 1;

  @override
  ProjectHiveModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ProjectHiveModel(
      id: fields[0] as String,
      projectName: fields[1] as String,
      position: fields[2] as String,
      address: fields[3] as String,
      companyName: fields[4] as String,
      site: fields[5] as String,
      status: fields[6] as Status,
      createdAt: fields[7] as DateTime,
    );
  }

  @override
  void write(BinaryWriter writer, ProjectHiveModel obj) {
    writer
      ..writeByte(8)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.projectName)
      ..writeByte(2)
      ..write(obj.position)
      ..writeByte(3)
      ..write(obj.address)
      ..writeByte(4)
      ..write(obj.companyName)
      ..writeByte(5)
      ..write(obj.site)
      ..writeByte(6)
      ..write(obj.status)
      ..writeByte(7)
      ..write(obj.createdAt);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ProjectHiveModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
