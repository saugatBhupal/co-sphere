import 'package:cosphere/src/core/domain/usecases/base_usecase.dart';
import 'package:cosphere/src/core/error/failure.dart';
import 'package:cosphere/src/features/jobs/data/dto/create_job/create_job_req_dto.dart';
import 'package:cosphere/src/features/jobs/domain/entities/job.dart';
import 'package:cosphere/src/features/jobs/domain/repositories/job_repository.dart';
import 'package:dartz/dartz.dart';

class CreateJobUsecase implements UsecaseWithParams<Job, CreateJobReqDto> {
  final JobRepository jobRepository;

  CreateJobUsecase({required this.jobRepository});

  @override
  Future<Either<Failure, Job>> call(CreateJobReqDto params) {
    return jobRepository.createJob(params);
  }
}
