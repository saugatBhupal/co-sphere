import 'package:cosphere/src/core/error/failure.dart';
import 'package:cosphere/src/features/jobs/data/dto/create_job/create_job_req_dto.dart';
import 'package:cosphere/src/features/jobs/domain/entities/job.dart';
import 'package:dartz/dartz.dart';

abstract interface class JobRepository {
  Future<Either<Failure, List<Job>>> getAppliedJobs(String uid);
  Future<Either<Failure, Job>> createJob(CreateJobReqDto dto);
}
