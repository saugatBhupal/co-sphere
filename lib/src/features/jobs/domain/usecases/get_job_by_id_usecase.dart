import 'package:cosphere/src/core/domain/usecases/base_usecase.dart';
import 'package:cosphere/src/core/error/failure.dart';
import 'package:cosphere/src/features/jobs/domain/entities/job.dart';
import 'package:cosphere/src/features/jobs/domain/repositories/job_repository.dart';
import 'package:dartz/dartz.dart';

class GetJobByIdUsecase implements UsecaseWithParams<Job, String> {
  final JobRepository jobRepository;

  GetJobByIdUsecase({required this.jobRepository});

  @override
  Future<Either<Failure, Job>> call(String params) {
    return jobRepository.getJobById(params);
  }
}
