import 'package:cosphere/src/features/jobs/data/models/local/job_hive_model.dart';
import 'package:cosphere/src/features/jobs/data/models/remote/job_api_model.dart';

abstract class JobLocalDatasource {
  void addAppliedJobs(List<JobApiModel> jobs);
  Future<List<JobHiveModel>> getAppliedJobs();
  void addCreatedJobs(List<JobApiModel> jobs);
  Future<List<JobHiveModel>> getCreatedJobs();
}
