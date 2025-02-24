import 'package:cosphere/src/features/jobs/data/models/local/job_hive_model.dart';
import 'package:cosphere/src/features/jobs/data/models/remote/job_api_model.dart';
import 'package:cosphere/src/features/jobs/domain/entities/job.dart';

extension JobHiveModelMappers on JobHiveModel {
  Job toDomain() => Job.initial().copyWith(
        // id: id,
        jobName: jobName,
        position: position,
        address: address,
        companyName: companyName,
        site: site,
        status: status,
        createdAt: createdAt,
      );
}

extension JobMappers on Job {
  JobHiveModel toDomain() => JobHiveModel(
        // id: id,
        jobName: jobName,
        position: position,
        address: address,
        companyName: companyName,
        site: site,
        status: status,
        createdAt: createdAt,
      );
}

extension JobApiExtension on JobApiModel {
  JobHiveModel fromApi() => JobHiveModel(
        // id: id,
        jobName: jobName,
        position: position,
        address: address,
        companyName: companyName,
        site: site,
        status: status,
        createdAt: createdAt,
      );
}
