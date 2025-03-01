import 'package:bloc_test/bloc_test.dart';
import 'package:cosphere/src/features/jobs/data/dto/apply_job/apply_job_req_dto.dart';
import 'package:cosphere/src/features/jobs/data/dto/create_job/create_job_req_dto.dart';
import 'package:cosphere/src/features/jobs/domain/entities/job.dart';
import 'package:cosphere/src/features/jobs/domain/entities/salary.dart';
import 'package:cosphere/src/features/jobs/domain/usecases/apply_to_job_usecase.dart';
import 'package:cosphere/src/features/jobs/domain/usecases/create_job_usecase.dart';
import 'package:cosphere/src/features/jobs/domain/usecases/created_job_usecase.dart';
import 'package:cosphere/src/features/jobs/domain/usecases/get_applied_jobs_usecase.dart';
import 'package:cosphere/src/features/jobs/domain/usecases/get_explore_jobs_usecase.dart';
import 'package:cosphere/src/features/jobs/domain/usecases/get_job_by_id_usecase.dart';
import 'package:cosphere/src/features/jobs/presentation/viewmodel/job_bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:uuid/uuid.dart';

import 'job_viewmodel_test.mocks.dart';

@GenerateNiceMocks([
  MockSpec<GetAppliedJobsUsecase>(),
  MockSpec<CreateJobUsecase>(),
  MockSpec<GetExploreJobsUsecase>(),
  MockSpec<ApplyToJobUsecase>(),
  MockSpec<CreatedJobUsecase>(),
  MockSpec<GetJobByIdUsecase>()
])
void main() {
  group('JobViewmodels', () {
    late GetAppliedJobsUsecase mockGetAppliedJobsUsecase;
    late CreateJobUsecase mockCreateJobUsecase;
    late GetExploreJobsUsecase mockGetExploreJobsUsecase;
    late ApplyToJobUsecase mockApplyToJobUsecase;
    late CreatedJobUsecase mockCreatedJobUsecase;
    late GetJobByIdUsecase mockGetJobByIdUsecase;

    setUp(() {
      mockGetAppliedJobsUsecase = MockGetAppliedJobsUsecase();
      mockCreateJobUsecase = MockCreateJobUsecase();
      mockGetExploreJobsUsecase = MockGetExploreJobsUsecase();
      mockApplyToJobUsecase = MockApplyToJobUsecase();
      mockCreatedJobUsecase = MockCreatedJobUsecase();
      mockGetJobByIdUsecase = MockGetJobByIdUsecase();
    });
    blocTest<JobBloc, JobState>(
      'emits [MyState] when MyEvent is added',
      build: () => JobBloc(
          getAppliedJobsUsecase: mockGetAppliedJobsUsecase,
          createJobUsecase: mockCreateJobUsecase,
          getExploreJobsUsecase: mockGetExploreJobsUsecase,
          applyToJobUsecase: mockApplyToJobUsecase,
          createdJobUsecase: mockCreatedJobUsecase,
          getJobByIdUsecase: mockGetJobByIdUsecase),
      act: (bloc) async {
        final jobId = const Uuid().v4();
        final userId = const Uuid().v4();
        final job = [Job.initial(), Job.initial()];

        // Applied Jobs
        when(mockGetAppliedJobsUsecase.call(jobId))
            .thenAnswer((_) async => Right(job));
        bloc.add(GetAppliedJob(uid: jobId));

        // Create Job
        final createDto = CreateJobReqDto(
          jobName: 'jobName',
          companyName: 'companyName',
          position: 'position',
          address: 'address',
          postedBy: const Uuid().v4(),
          skills: ['skill1', 'skill2'],
          site: 'site',
          salary: Salary.initial(),
        );
        when(mockCreateJobUsecase.call(createDto))
            .thenAnswer((_) async => Right(job.first));
        bloc.add(CreateJob(dto: createDto));

        // Explore Jobs
        when(mockGetExploreJobsUsecase.call(userId))
            .thenAnswer((_) async => Right(job));
        bloc.add(GetExploreJobs(uid: userId));

        // Apply Job
        final applyDto = ApplyJobReqDto(userId: userId, jobId: jobId);
        when(mockApplyToJobUsecase.call(applyDto))
            .thenAnswer((_) async => Right(job.last));
        bloc.add(ApplyToJob(dto: applyDto));

        // Created Job
        when(mockCreatedJobUsecase.call(userId))
            .thenAnswer((_) async => Right(job));
        bloc.add(CreatedJobs(uid: userId));

        // Job by Id
        when(mockGetJobByIdUsecase.call(jobId))
            .thenAnswer((_) async => Right(job.first));
        bloc.add(GetJobById(id: jobId));
      },
      expect: () => [
        isA<GetAppliedJobLoading>(),
        isA<GetAppliedJobSuccess>(),
        isA<CreateJobLoading>(),
        isA<CreateJobSuccess>(),
        isA<GetExploreJobsLoading>(),
        isA<GetExploreJobsSuccess>(),
        isA<ApplyToJobLoading>(),
        isA<ApplyToJobSuccess>(),
        isA<CreatedJobsLoading>(),
        isA<CreatedJobsSuccess>(),
        isA<GetJobByIdLoading>(),
        isA<GetJobByIdSuccess>(),
      ],
    );
  });
}
