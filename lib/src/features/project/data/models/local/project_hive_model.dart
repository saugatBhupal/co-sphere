import 'package:cosphere/src/core/constants/hive_table.dart';
import 'package:equatable/equatable.dart';
import 'package:cosphere/src/core/constants/app_enums.dart';
import 'package:cosphere/src/features/jobs/domain/entities/salary.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'project_hive_model.g.dart';

@HiveType(typeId: HiveTable.projectTableId)
class ProjectHiveModel extends Equatable {
  @HiveField(0)
  final String id;
  @HiveField(1)
  final String projectName;
  @HiveField(2)
  final String position;
  @HiveField(3)
  final String address;
  @HiveField(4)
  final String companyName;
  @HiveField(5)
  final String site;
  @HiveField(6)
  final Status status;
  @HiveField(7)
  final DateTime createdAt;

  const ProjectHiveModel({
    required this.id,
    required this.projectName,
    required this.position,
    required this.address,
    required this.companyName,
    required this.site,
    required this.status,
    required this.createdAt,
  });

  @override
  List<Object> get props {
    return [
      id,
      projectName,
      position,
      address,
      companyName,
      site,
      status,
      createdAt,
    ];
  }
}
