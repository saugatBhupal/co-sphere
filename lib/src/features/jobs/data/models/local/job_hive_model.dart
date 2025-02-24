import 'package:cosphere/src/core/constants/hive_table.dart';
import 'package:equatable/equatable.dart';
import 'package:cosphere/src/core/constants/app_enums.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'job_hive_model.g.dart';

@HiveType(typeId: HiveTable.jobTableId)
class JobHiveModel extends Equatable {
  // @HiveField(0)
  // final String id;
  @HiveField(0)
  final String jobName;
  @HiveField(1)
  final String position;
  @HiveField(2)
  final String address;
  @HiveField(3)
  final String companyName;
  @HiveField(4)
  final String site;
  @HiveField(5)
  final Status status;
  @HiveField(6)
  final DateTime createdAt;

  const JobHiveModel({
    // required this.id,
    required this.jobName,
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
      // id,
      jobName,
      position,
      address,
      companyName,
      site,
      status,
      createdAt,
    ];
  }
}
