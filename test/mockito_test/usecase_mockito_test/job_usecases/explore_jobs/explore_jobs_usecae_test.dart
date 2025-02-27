import 'package:cosphere/src/core/error/failure.dart';
import 'package:cosphere/src/features/jobs/domain/entities/job.dart';
import 'package:cosphere/src/features/jobs/domain/repositories/job_repository.dart';
import 'package:cosphere/src/features/jobs/domain/usecases/get_explore_jobs_usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:uuid/uuid.dart';

import 'explore_jobs_usecae_test.mocks.dart';

@GenerateMocks([JobRepository])
void main() {
  late MockJobRepository mockJobRepository;
  late GetExploreJobsUsecase getExploreJobsUsecase;

  setUp(() {
    mockJobRepository = MockJobRepository();
    getExploreJobsUsecase =
        GetExploreJobsUsecase(jobRepository: mockJobRepository);
  });

  final dto = const Uuid().v4();
  test('should return the list of new jobs ', () async {
    final job = [Job.initial(), Job.initial()];

    when(mockJobRepository.getExploreJobs(dto))
        .thenAnswer((_) async => Right(job));

    final result = await getExploreJobsUsecase(dto);

    expect(result, Right(job));
    verify(mockJobRepository.getExploreJobs(dto)).called(1);
    verifyNoMoreInteractions(mockJobRepository);
  });

  test('should return Failure when an error occurs', () async {
    const failure = Failure(message: "Missing required fields");

    when(mockJobRepository.getExploreJobs(dto))
        .thenAnswer((_) async => const Left(failure));

    final result = await getExploreJobsUsecase(dto);

    expect(result, const Left(failure));
    verify(mockJobRepository.getExploreJobs(dto)).called(1);
    verifyNoMoreInteractions(mockJobRepository);
  });
}
