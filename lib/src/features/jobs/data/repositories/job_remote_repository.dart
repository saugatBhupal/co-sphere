import 'package:cosphere/src/core/error/failure.dart';
import 'package:cosphere/src/core/network/connectivity_checker.dart';
import 'package:cosphere/src/features/jobs/data/datasources/local/job_local_datasource.dart';
import 'package:cosphere/src/features/jobs/data/datasources/remote/job_remote_datasource.dart';
import 'package:cosphere/src/features/jobs/data/dto/create_job/create_job_req_dto.dart';
import 'package:cosphere/src/features/jobs/data/models/mappers/job_local_mappers.dart';
import 'package:cosphere/src/features/jobs/data/models/mappers/job_mappers.dart';
import 'package:cosphere/src/features/jobs/data/models/remote/job_api_model.dart';
import 'package:cosphere/src/features/jobs/domain/entities/job.dart';
import 'package:cosphere/src/features/jobs/domain/repositories/job_repository.dart';
import 'package:dartz/dartz.dart';

class JobRemoteRepository implements JobRepository {
  final JobRemoteDatasource datasource;
  final JobLocalDatasource localDatasource;
  final BaseCheckInternetConnectivity checkInternetConnectivity;
  JobRemoteRepository(
      {required this.datasource,
      required this.localDatasource,
      required this.checkInternetConnectivity});

  @override
  Future<Either<Failure, List<Job>>> getAppliedJobs(String uid) async {
    if (await checkInternetConnectivity.isConnected()) {
      try {
        final List<JobApiModel> jobs = await datasource.getAppliedJobs(uid);
        return Right(jobs.map((job) => job.toDomain()).toList());
      } catch (e) {
        return Left(Failure(message: e.toString()));
      }
    } else {
      final jobs = await localDatasource.getAppliedJobs();
      return Right(jobs.map((e) => e.toDomain()).toList());
    }
  }

  @override
  Future<Either<Failure, Job>> createJob(CreateJobReqDto dto) async {
    try {
      final JobApiModel job = await datasource.createJob(dto);
      return Right(job.toDomain());
    } catch (e) {
      return Left(Failure(message: e.toString()));
    }
  }
}
