import 'package:cosphere/src/core/constants/app_enums.dart';
import 'package:hive_flutter/hive_flutter.dart';

class StatusAdapter extends TypeAdapter<Status> {
  @override
  final int typeId = 2;

  @override
  Status read(BinaryReader reader) {
    return Status.values[reader.readInt()];
  }

  @override
  void write(BinaryWriter writer, Status obj) {
    writer.writeInt(obj.index);
  }
}
