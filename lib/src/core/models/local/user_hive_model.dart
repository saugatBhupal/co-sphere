import 'package:cosphere/src/core/constants/hive_table.dart';
import 'package:equatable/equatable.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:uuid/uuid.dart';

part 'user_hive_model.g.dart';

@HiveType(typeId: HiveTable.userTableId)
class UserHiveModel extends Equatable {
  @HiveField(0)
  final String? uid;
  @HiveField(1)
  final String email;
  @HiveField(2)
  final String name;
  @HiveField(3)
  final String dob;
  @HiveField(4)
  final String address;
  @HiveField(5)
  final String password;
  @HiveField(6)
  final bool verified;

  UserHiveModel({
    String? uid,
    required this.email,
    required this.name,
    required this.dob,
    required this.address,
    required this.password,
    required this.verified,
  }) : uid = uid ?? const Uuid().v4();
  @override
  List<Object?> get props => [];
}
