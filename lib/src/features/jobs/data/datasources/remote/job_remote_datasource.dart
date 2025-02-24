import 'package:cosphere/src/features/jobs/data/models/remote/job_api_model.dart';

abstract interface class JobRemoteDatasource {
  Future<List<JobApiModel>> getAppliedJobs(String uid);
}
