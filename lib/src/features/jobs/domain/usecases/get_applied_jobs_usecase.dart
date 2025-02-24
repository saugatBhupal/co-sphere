import 'package:cosphere/src/core/domain/usecases/base_usecase.dart';
import 'package:cosphere/src/core/error/failure.dart';
import 'package:cosphere/src/features/jobs/domain/entities/job.dart';
import 'package:cosphere/src/features/jobs/domain/repositories/job_repository.dart';
import 'package:dartz/dartz.dart';

class GetAppliedJobsUsecase implements UsecaseWithParams<List<Job>, String> {
  final JobRepository jobRepository;

  GetAppliedJobsUsecase({required this.jobRepository});

  @override
  Future<Either<Failure, List<Job>>> call(String params) {
    return jobRepository.getAppliedJobs(params);
  }
}
