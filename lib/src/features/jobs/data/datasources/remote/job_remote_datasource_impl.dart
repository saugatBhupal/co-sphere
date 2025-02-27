import 'package:cosphere/src/core/error/failure.dart';
import 'package:cosphere/src/core/http/api_endpoints.dart';
import 'package:cosphere/src/core/http/handle_error_response.dart';
import 'package:cosphere/src/features/jobs/data/datasources/local/job_local_datasource.dart';
import 'package:cosphere/src/features/jobs/data/datasources/remote/job_remote_datasource.dart';
import 'package:cosphere/src/features/jobs/data/dto/apply_job/apply_job_req_dto.dart';
import 'package:cosphere/src/features/jobs/data/dto/create_job/create_job_req_dto.dart';
import 'package:cosphere/src/features/jobs/data/models/remote/job_api_model.dart';
import 'package:dio/dio.dart';

class JobRemoteDatasourceImpl implements JobRemoteDatasource {
  final Dio dio;
  final JobLocalDatasource localDatasource;
  JobRemoteDatasourceImpl({required this.dio, required this.localDatasource});

  @override
  Future<List<JobApiModel>> getAppliedJobs(String uid) async {
    try {
      var res = await dio.get("${ApiEndpoints.getAppliedJobs}$uid");
      if (res.statusCode == 200) {
        final List<JobApiModel> jobs = (res.data as List<dynamic>)
            .map((json) => JobApiModel.fromJson(json as Map<String, dynamic>))
            .toList();
        print(jobs);
        if (jobs.isNotEmpty) {
          localDatasource.addAppliedJobs(jobs);
        }
        return jobs;
      } else {
        throw Failure(
          message: res.statusMessage.toString(),
          statusCode: res.statusMessage.toString(),
        );
      }
    } on DioException catch (e) {
      return await handleErrorResponse(e);
    }
  }

  @override
  Future<JobApiModel> createJob(CreateJobReqDto dto) async {
    try {
      var res = await dio.post(ApiEndpoints.job, data: dto.toJson());
      if (res.statusCode == 200) {
        return JobApiModel.fromJson(res.data);
      } else {
        throw Failure(
          message: res.data['message'],
          statusCode: res.statusMessage.toString(),
        );
      }
    } on DioException catch (e) {
      print("Dio Exception: ${e.response?.statusCode} ${e.response?.data}");
      return await handleErrorResponse(e);
    }
  }

  @override
  Future<JobApiModel> applyToJob(ApplyJobReqDto dto) async {
    try {
      var res = await dio.post(ApiEndpoints.applyToJob, data: dto.toJson());
      if (res.statusCode == 200) {
        return JobApiModel.fromJson(res.data['job']);
      } else {
        throw Failure(
          message: res.statusMessage.toString(),
          statusCode: res.statusMessage.toString(),
        );
      }
    } on DioException catch (e) {
      return await handleErrorResponse(e);
    }
  }

  @override
  Future<List<JobApiModel>> getExploreJobs(String uid) async {
    try {
      var res = await dio.get("${ApiEndpoints.getExploreJobs}$uid");
      if (res.statusCode == 200) {
        final List<JobApiModel> jobs = (res.data as List<dynamic>)
            .map((json) => JobApiModel.fromJson(json as Map<String, dynamic>))
            .toList();
        return jobs;
      } else {
        throw Failure(
          message: res.statusMessage.toString(),
          statusCode: res.statusMessage.toString(),
        );
      }
    } on DioException catch (e) {
      return await handleErrorResponse(e);
    }
  }
}
