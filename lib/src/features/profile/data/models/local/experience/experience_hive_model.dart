import 'package:cosphere/src/core/constants/hive_table.dart';
import 'package:equatable/equatable.dart';
import 'package:hive_flutter/hive_flutter.dart';
part 'experience_hive_model.g.dart';

@HiveType(typeId: HiveTable.experienceTableId)
class ExperienceHiveModel extends Equatable {
  @HiveField(0)
  final String id;
  @HiveField(1)
  final String position;
  @HiveField(2)
  final String organization;
  @HiveField(3)
  final String status;
  @HiveField(4)
  final DateTime from;
  @HiveField(5)
  final DateTime to;

  const ExperienceHiveModel({
    required this.id,
    required this.position,
    required this.organization,
    required this.status,
    required this.from,
    required this.to,
  });

  @override
  List<Object> get props {
    return [
      id,
      organization,
      position,
      status,
      from,
      to,
    ];
  }
}
