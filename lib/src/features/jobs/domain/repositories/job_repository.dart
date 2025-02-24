import 'package:cosphere/src/core/error/failure.dart';
import 'package:cosphere/src/features/jobs/domain/entities/job.dart';
import 'package:dartz/dartz.dart';

abstract interface class JobRepository {
  Future<Either<Failure, List<Job>>> getAppliedJobs(String uid);
}
