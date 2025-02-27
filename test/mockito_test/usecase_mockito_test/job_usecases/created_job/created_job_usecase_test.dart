import 'package:cosphere/src/core/error/failure.dart';
import 'package:cosphere/src/features/jobs/domain/entities/job.dart';
import 'package:cosphere/src/features/jobs/domain/repositories/job_repository.dart';
import 'package:cosphere/src/features/jobs/domain/usecases/created_job_usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:uuid/uuid.dart';

import 'created_job_usecase_test.mocks.dart';

@GenerateMocks([JobRepository])
void main() {
  late MockJobRepository mockJobRepository;
  late CreatedJobUsecase createdJobUsecase;

  setUp(() {
    mockJobRepository = MockJobRepository();
    createdJobUsecase = CreatedJobUsecase(jobRepository: mockJobRepository);
  });

  final dto = const Uuid().v4();
  test('should return the list of job created by the user', () async {
    final job = [Job.initial(), Job.initial()];

    when(mockJobRepository.createdJobs(dto))
        .thenAnswer((_) async => Right(job));

    final result = await createdJobUsecase(dto);

    expect(result, Right(job));
    verify(mockJobRepository.createdJobs(dto)).called(1);
    verifyNoMoreInteractions(mockJobRepository);
  });

  test('should return Failure when an error occurs', () async {
    const failure = Failure(message: "Missing required fields");

    when(mockJobRepository.createdJobs(dto))
        .thenAnswer((_) async => const Left(failure));

    final result = await createdJobUsecase(dto);

    expect(result, const Left(failure));
    verify(mockJobRepository.createdJobs(dto)).called(1);
    verifyNoMoreInteractions(mockJobRepository);
  });
}
