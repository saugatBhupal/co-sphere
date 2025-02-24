import 'package:cosphere/src/core/constants/hive_table.dart';
import 'package:equatable/equatable.dart';
import 'package:hive_flutter/hive_flutter.dart';
part 'experience_hive_model.g.dart';

@HiveType(typeId: HiveTable.experienceTableId)
class ExperienceHiveModel extends Equatable {
  @HiveField(0)
  final String id;
  @HiveField(1)
  final String organization;
  @HiveField(2)
  final String degree;
  @HiveField(3)
  final DateTime from;
  @HiveField(4)
  final DateTime to;

  const ExperienceHiveModel({
    required this.id,
    required this.organization,
    required this.degree,
    required this.from,
    required this.to,
  });

  @override
  List<Object> get props {
    return [
      id,
      organization,
      degree,
      from,
      to,
    ];
  }
}
