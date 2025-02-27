import 'package:cosphere/src/core/error/failure.dart';
import 'package:cosphere/src/features/jobs/data/dto/create_job/create_job_req_dto.dart';
import 'package:cosphere/src/features/jobs/domain/entities/job.dart';
import 'package:cosphere/src/features/jobs/domain/entities/salary.dart';
import 'package:cosphere/src/features/jobs/domain/repositories/job_repository.dart';
import 'package:cosphere/src/features/jobs/domain/usecases/create_job_usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:uuid/uuid.dart';

import 'create_job_usecase_test.mocks.dart';

@GenerateMocks([JobRepository])
void main() {
  late MockJobRepository mockJobRepository;
  late CreateJobUsecase createJobUsecase;

  setUp(() {
    mockJobRepository = MockJobRepository();
    createJobUsecase = CreateJobUsecase(jobRepository: mockJobRepository);
  });

  final dto = CreateJobReqDto(
    jobName: 'jobName',
    companyName: 'companyName',
    position: 'position',
    address: 'address',
    postedBy: const Uuid().v4(),
    skills: ['skill1', 'skill2'],
    site: 'site',
    salary: Salary.initial(),
  );
  test('should return the job after adding the project to database', () async {
    final job = Job.initial();

    when(mockJobRepository.createJob(dto)).thenAnswer((_) async => Right(job));

    final result = await createJobUsecase(dto);

    expect(result, Right(job));
    verify(mockJobRepository.createJob(dto)).called(1);
    verifyNoMoreInteractions(mockJobRepository);
  });

  test('should return Failure when an error occurs', () async {
    const failure = Failure(message: "Missing required fields");

    when(mockJobRepository.createJob(dto))
        .thenAnswer((_) async => const Left(failure));

    final result = await createJobUsecase(dto);

    expect(result, const Left(failure));
    verify(mockJobRepository.createJob(dto)).called(1);
    verifyNoMoreInteractions(mockJobRepository);
  });
}
