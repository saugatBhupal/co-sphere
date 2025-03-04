import 'package:cosphere/src/core/error/failure.dart';
import 'package:cosphere/src/features/jobs/domain/entities/job.dart';
import 'package:cosphere/src/features/jobs/domain/repositories/job_repository.dart';
import 'package:cosphere/src/features/jobs/domain/usecases/get_applied_jobs_usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:uuid/uuid.dart';

import 'applied_jobs_usecase_test.mocks.dart';

@GenerateMocks([JobRepository])
void main() {
  late MockJobRepository mockJobRepository;
  late GetAppliedJobsUsecase appliedJobsUsecase;

  setUp(() {
    mockJobRepository = MockJobRepository();
    appliedJobsUsecase =
        GetAppliedJobsUsecase(jobRepository: mockJobRepository);
  });

  final dto = const Uuid().v4();
  test('should return the List job applied by the user', () async {
    final job = [Job.initial(), Job.initial()];
    final jobData = [Job.initial().copyWith(id: const Uuid().v4()), Job.initial()];

    when(mockJobRepository.getAppliedJobs(dto))
        .thenAnswer((_) async => Right(job));

    final result = await appliedJobsUsecase(dto);

    expect(result, Right(jobData));
    verify(mockJobRepository.getAppliedJobs(dto)).called(1);
    verifyNoMoreInteractions(mockJobRepository);
  });

  test('should return Failure when an error occurs', () async {
    const failure = Failure(message: "Missing required fields");

    when(mockJobRepository.getAppliedJobs(dto))
        .thenAnswer((_) async => const Left(failure));

    final result = await appliedJobsUsecase(dto);

    expect(result, const Left(failure));
    verify(mockJobRepository.getAppliedJobs(dto)).called(1);
    verifyNoMoreInteractions(mockJobRepository);
  });
}
