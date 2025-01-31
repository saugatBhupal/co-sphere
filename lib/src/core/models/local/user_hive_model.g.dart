// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_hive_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UserHiveModelAdapter extends TypeAdapter<UserHiveModel> {
  @override
  final int typeId = 0;

  @override
  UserHiveModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UserHiveModel(
      uid: fields[0] as String?,
      email: fields[1] as String,
      name: fields[2] as String,
      dob: fields[3] as DateTime,
      country: fields[4] as String,
      province: fields[5] as String,
      city: fields[6] as String,
      password: fields[7] as String,
      verified: fields[8] as bool,
      phone: fields[9] as String,
    );
  }

  @override
  void write(BinaryWriter writer, UserHiveModel obj) {
    writer
      ..writeByte(10)
      ..writeByte(0)
      ..write(obj.uid)
      ..writeByte(1)
      ..write(obj.email)
      ..writeByte(2)
      ..write(obj.name)
      ..writeByte(3)
      ..write(obj.dob)
      ..writeByte(4)
      ..write(obj.country)
      ..writeByte(5)
      ..write(obj.province)
      ..writeByte(6)
      ..write(obj.city)
      ..writeByte(7)
      ..write(obj.password)
      ..writeByte(8)
      ..write(obj.verified)
      ..writeByte(9)
      ..write(obj.phone);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserHiveModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
