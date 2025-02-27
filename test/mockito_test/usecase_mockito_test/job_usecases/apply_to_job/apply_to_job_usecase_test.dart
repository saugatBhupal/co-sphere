import 'package:cosphere/src/core/error/failure.dart';
import 'package:cosphere/src/features/jobs/data/dto/apply_job/apply_job_req_dto.dart';
import 'package:cosphere/src/features/jobs/domain/entities/job.dart';
import 'package:cosphere/src/features/jobs/domain/repositories/job_repository.dart';
import 'package:cosphere/src/features/jobs/domain/usecases/apply_to_job_usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:uuid/uuid.dart';

import 'apply_to_job_usecase_test.mocks.dart';

@GenerateMocks([JobRepository])
void main() {
  late MockJobRepository mockProjectRepository;
  late ApplyToJobUsecase applyToJobUsecase;

  setUp(() {
    mockProjectRepository = MockJobRepository();
    applyToJobUsecase = ApplyToJobUsecase(jobRepository: mockProjectRepository);
  });

  final dto =
      ApplyJobReqDto(userId: const Uuid().v4(), jobId: const Uuid().v4());
  test('should return the applied job', () async {
    final job = Job.initial();

    when(mockProjectRepository.applyToJob(dto))
        .thenAnswer((_) async => Right(job));

    final result = await applyToJobUsecase(dto);

    expect(result, Right(job));
    verify(mockProjectRepository.applyToJob(dto)).called(1);
    verifyNoMoreInteractions(mockProjectRepository);
  });

  test('should return Failure when an error occurs', () async {
    const failure = Failure(message: "Failed to apply to project");

    when(mockProjectRepository.applyToJob(dto))
        .thenAnswer((_) async => const Left(failure));

    final result = await applyToJobUsecase(dto);

    expect(result, const Left(failure));
    verify(mockProjectRepository.applyToJob(dto)).called(1);
    verifyNoMoreInteractions(mockProjectRepository);
  });
}
