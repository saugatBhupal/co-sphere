import 'package:cosphere/src/features/jobs/data/dto/apply_job/apply_job_req_dto.dart';
import 'package:cosphere/src/features/jobs/data/dto/create_job/create_job_req_dto.dart';
import 'package:cosphere/src/features/jobs/data/models/remote/job_api_model.dart';

abstract interface class JobRemoteDatasource {
  Future<List<JobApiModel>> getAppliedJobs(String uid);
  Future<JobApiModel> createJob(CreateJobReqDto dto);
  Future<List<JobApiModel>> getExploreJobs(String uid);
  Future<JobApiModel> applyToJob(ApplyJobReqDto dto);
  Future<List<JobApiModel>> createdJobs(String uid);
  Future<JobApiModel> getJobById(String id);
}
