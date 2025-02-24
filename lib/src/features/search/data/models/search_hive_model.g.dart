// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_hive_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class SearchHiveModelAdapter extends TypeAdapter<SearchHiveModel> {
  @override
  final int typeId = 4;

  @override
  SearchHiveModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return SearchHiveModel(
      id: fields[0] as String,
      query: fields[1] as String,
      date: fields[2] as DateTime,
    );
  }

  @override
  void write(BinaryWriter writer, SearchHiveModel obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.query)
      ..writeByte(2)
      ..write(obj.date);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SearchHiveModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
