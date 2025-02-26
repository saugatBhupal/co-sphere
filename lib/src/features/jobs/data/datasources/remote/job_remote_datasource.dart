import 'package:cosphere/src/features/jobs/data/dto/create_job/create_job_req_dto.dart';
import 'package:cosphere/src/features/jobs/data/models/remote/job_api_model.dart';

abstract interface class JobRemoteDatasource {
  Future<List<JobApiModel>> getAppliedJobs(String uid);
  Future<JobApiModel> createJob(CreateJobReqDto dto);
}
