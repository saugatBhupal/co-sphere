import 'package:cosphere/src/core/domain/usecases/base_usecase.dart';
import 'package:cosphere/src/core/error/failure.dart';
import 'package:cosphere/src/features/jobs/data/dto/apply_job/apply_job_req_dto.dart';
import 'package:cosphere/src/features/jobs/domain/entities/job.dart';
import 'package:cosphere/src/features/jobs/domain/repositories/job_repository.dart';
import 'package:dartz/dartz.dart';

class ApplyToJobUsecase implements UsecaseWithParams<Job, ApplyJobReqDto> {
  final JobRepository jobRepository;

  ApplyToJobUsecase({required this.jobRepository});

  @override
  Future<Either<Failure, Job>> call(ApplyJobReqDto params) {
    return jobRepository.applyToJob(params);
  }
}
