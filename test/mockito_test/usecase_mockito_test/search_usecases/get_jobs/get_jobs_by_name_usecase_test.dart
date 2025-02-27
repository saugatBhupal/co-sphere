import 'package:cosphere/src/core/error/failure.dart';
import 'package:cosphere/src/features/jobs/domain/entities/job.dart';
import 'package:cosphere/src/features/search/domain/repositories/search_repository.dart';
import 'package:cosphere/src/features/search/domain/usecases/get_jobs_by_name_usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'get_jobs_by_name_usecase_test.mocks.dart';

@GenerateMocks([SearchRepository])
void main() {
  late MockSearchRepository mockSearchRepository;
  late GetJobsByNameUsecase getJobsByNameUsecase;

  setUp(() {
    mockSearchRepository = MockSearchRepository();
    getJobsByNameUsecase =
        GetJobsByNameUsecase(searchRepository: mockSearchRepository);
  });

  test('should return jobs related to the query params', () async {
    final jobLst = [Job.initial(), Job.initial(), Job.initial()];
    const String query = "Jobname";

    when(mockSearchRepository.getJobsByName(query))
        .thenAnswer((_) async => Right(jobLst));

    final result = await getJobsByNameUsecase(query);

    expect(result, Right(jobLst));
    verify(mockSearchRepository.getJobsByName(query)).called(1);
    verifyNoMoreInteractions(mockSearchRepository);
  });

  test('should return Failure when an error occurs', () async {
    const String query = "Jobname";
    const failure = Failure(message: "Invalid Request");

    when(mockSearchRepository.getJobsByName(query))
        .thenAnswer((_) async => const Left(failure));

    final result = await getJobsByNameUsecase(query);

    expect(result, const Left(failure));
    verify(mockSearchRepository.getJobsByName(query)).called(1);
    verifyNoMoreInteractions(mockSearchRepository);
  });
}
