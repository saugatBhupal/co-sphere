import 'package:bloc_test/bloc_test.dart';
import 'package:cosphere/src/core/constants/app_enums.dart';
import 'package:cosphere/src/features/jobs/domain/entities/applicants.dart';
import 'package:cosphere/src/features/jobs/domain/entities/salary.dart';
import 'package:cosphere/src/features/profile/data/models/mappers/review_mapper.dart';
import 'package:cosphere/src/features/profile/domain/entities/reviews.dart';
import 'package:cosphere/src/features/project/data/dto/add_review/add_review_req_dto.dart';
import 'package:cosphere/src/features/project/data/dto/apply_project/apply_project_req_dto.dart';
import 'package:cosphere/src/features/project/data/dto/complete_project/complete_project_req_dto.dart';
import 'package:cosphere/src/features/project/data/dto/create_project/create_project_req_dto.dart';
import 'package:cosphere/src/features/project/data/dto/create_task/create_task_req_dto.dart';
import 'package:cosphere/src/features/project/data/dto/hire_user/hire_user_req_dto.dart';
import 'package:cosphere/src/features/project/domain/entities/project.dart';
import 'package:cosphere/src/features/project/domain/entities/tasks.dart';
import 'package:cosphere/src/features/project/domain/usecases/add_review_usecase.dart';
import 'package:cosphere/src/features/project/domain/usecases/apply_to_project_usecase.dart';
import 'package:cosphere/src/features/project/domain/usecases/complete_project_usecse.dart';
import 'package:cosphere/src/features/project/domain/usecases/complete_task_usecase.dart';
import 'package:cosphere/src/features/project/domain/usecases/create_project_usecase.dart';
import 'package:cosphere/src/features/project/domain/usecases/create_task_usecase.dart';
import 'package:cosphere/src/features/project/domain/usecases/finish_hiring_usecase.dart';
import 'package:cosphere/src/features/project/domain/usecases/get_active_project_user_usecase.dart';
import 'package:cosphere/src/features/project/domain/usecases/get_applied_projects_usecase.dart';
import 'package:cosphere/src/features/project/domain/usecases/get_completed_project_user_usecase.dart';
import 'package:cosphere/src/features/project/domain/usecases/get_explore_project_usecase.dart';
import 'package:cosphere/src/features/project/domain/usecases/get_hiring_projects_user_usecase.dart';
import 'package:cosphere/src/features/project/domain/usecases/get_project_by_id_usecase.dart';
import 'package:cosphere/src/features/project/domain/usecases/get_projects_user_usecase.dart';
import 'package:cosphere/src/features/project/domain/usecases/get_review_by_id_usecase.dart';
import 'package:cosphere/src/features/project/domain/usecases/hire_user_usecase.dart';
import 'package:cosphere/src/features/project/domain/usecases/reject_user_usecase.dart';
import 'package:cosphere/src/features/project/presentation/viewmodels/project_bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:uuid/uuid.dart';

import 'project_viewmodel_test.mocks.dart';

@GenerateNiceMocks([
  MockSpec<AddReviewUsecase>(),
  MockSpec<ApplyToProjectUsecase>(),
  MockSpec<CompleteProjectUsecase>(),
  MockSpec<CompleteTaskUsecase>(),
  MockSpec<CreateProjectUsecase>(),
  MockSpec<CreateTaskUsecase>(),
  MockSpec<FinishHiringUsecase>(),
  MockSpec<GetActiveProjectUserUsecase>(),
  MockSpec<GetAppliedProjectsUsecase>(),
  MockSpec<GetCompletedProjectUserUsecase>(),
  MockSpec<GetExploreProjectUsecase>(),
  MockSpec<GetHiringProjectsUserUsecase>(),
  MockSpec<GetProjectByIdUsecase>(),
  MockSpec<GetProjectsUserUsecase>(),
  MockSpec<GetReviewByIdUsecase>(),
  MockSpec<HireUserUsecase>(),
  MockSpec<RejectUserUsecase>(),
])
void main() {
  group('ProjectViewmodels', () {
    late AddReviewUsecase mockAddReviewUsecase;
    late ApplyToProjectUsecase mockApplyToProjectUsecase;
    late CompleteProjectUsecase mockCompleteProjectUsecase;
    late CompleteTaskUsecase mockCompleteTaskUsecase;
    late CreateTaskUsecase mockCreateTaskUsecase;
    late CreateProjectUsecase mockCreateProjectUsecase;
    late FinishHiringUsecase mockFinishHiringUsecase;
    late GetActiveProjectUserUsecase mockGetActiveProjectUserUsecase;
    late GetAppliedProjectsUsecase mockGetAppliedProjectsUsecase;
    late GetCompletedProjectUserUsecase mockGetCompletedProjectUserUsecase;
    late GetExploreProjectUsecase mockGetExploreProjectUsecase;
    late GetHiringProjectsUserUsecase mockGetHiringProjectsUserUsecase;
    late GetProjectByIdUsecase mockGetProjectByIdUsecase;
    late GetProjectsUserUsecase mockGetProjectsUserUsecase;
    late GetReviewByIdUsecase mockGetReviewByIdUsecase;
    late HireUserUsecase mockHireUserUsecase;
    late RejectUserUsecase mockRejectUserUsecase;

    setUp(() {
      mockAddReviewUsecase = MockAddReviewUsecase();
      mockApplyToProjectUsecase = MockApplyToProjectUsecase();
      mockCompleteProjectUsecase = MockCompleteProjectUsecase();
      mockCompleteTaskUsecase = MockCompleteTaskUsecase();
      mockCreateTaskUsecase = MockCreateTaskUsecase();
      mockCreateProjectUsecase = MockCreateProjectUsecase();
      mockFinishHiringUsecase = MockFinishHiringUsecase();
      mockGetActiveProjectUserUsecase = MockGetActiveProjectUserUsecase();
      mockGetAppliedProjectsUsecase = MockGetAppliedProjectsUsecase();
      mockGetCompletedProjectUserUsecase = MockGetCompletedProjectUserUsecase();
      mockGetExploreProjectUsecase = MockGetExploreProjectUsecase();
      mockGetHiringProjectsUserUsecase = MockGetHiringProjectsUserUsecase();
      mockGetProjectByIdUsecase = MockGetProjectByIdUsecase();
      mockGetProjectsUserUsecase = MockGetProjectsUserUsecase();
      mockGetReviewByIdUsecase = MockGetReviewByIdUsecase();
      mockHireUserUsecase = MockHireUserUsecase();
      mockRejectUserUsecase = MockRejectUserUsecase();
    });

    blocTest<ProjectBloc, ProjectState>(
      'emits [MyState] when MyEvent is added',
      build: () => ProjectBloc(
        getHiringProjectsUserUsecase: mockGetHiringProjectsUserUsecase,
        getActiveProjectUserUsecase: mockGetActiveProjectUserUsecase,
        getCompletedProjectUserUsecase: mockGetCompletedProjectUserUsecase,
        hireUserUsecase: mockHireUserUsecase,
        rejectUserUsecase: mockRejectUserUsecase,
        finishHiringUsecase: mockFinishHiringUsecase,
        getProjectByIdUsecase: mockGetProjectByIdUsecase,
        completeTaskUsecase: mockCompleteTaskUsecase,
        createTaskUsecase: mockCreateTaskUsecase,
        getProjectsUserUsecase: mockGetProjectsUserUsecase,
        getAppliedProjectsUsecase: mockGetAppliedProjectsUsecase,
        addReviewUsecase: mockAddReviewUsecase,
        completeProjectUsecse: mockCompleteProjectUsecase,
        getReviewByIdUsecase: mockGetReviewByIdUsecase,
        createProjectUsecase: mockCreateProjectUsecase,
        getExploreProjectUsecase: mockGetExploreProjectUsecase,
        applyToProjectUsecase: mockApplyToProjectUsecase,
      ),
      act: (bloc) async {
        // Get Hiring Projects
        final userId = const Uuid().v4();
        final projectId = const Uuid().v4();
        final reviewId = const Uuid().v4();
        final task = [Tasks.initial(), Tasks.initial()];
        final applicant = [Applicants.initial(), Applicants.initial()];
        final projectLst = [Project.initial(), Project.initial()];
        final reviewLst = [
          Reviews.initial(),
          Reviews.initial(),
          Reviews.initial(),
        ];

        when(mockGetHiringProjectsUserUsecase.call(userId))
            .thenAnswer((_) async => Right(projectLst));
        bloc.add(GetHiringProject(uid: userId));

        // Get Active Project
        when(mockGetActiveProjectUserUsecase.call(userId ))
            .thenAnswer((_) async => Right(projectLst));
        bloc.add(GetActiveProject(uid: userId));

        // Get Complete Project
        when(mockGetCompletedProjectUserUsecase.call(userId))
            .thenAnswer((_) async => Right(projectLst));
        bloc.add(GetCompletedProject(uid: userId));

        // Hire User
        final hireDto = HireUserReqDto(userId: userId, projectId: projectId);

        when(mockHireUserUsecase.call(hireDto))
            .thenAnswer((_) async => Right(applicant.first));
        bloc.add(HireUser(dto: hireDto));

        // Reject User
        when(mockRejectUserUsecase.call(hireDto))
            .thenAnswer((_) async => Right(applicant.first));
        bloc.add(RejectUser(dto: hireDto));

        // Finish Hiring
        when(mockFinishHiringUsecase.call(projectId)).thenAnswer((_) async =>
            const Right("Hiring has completed. Project moved to active"));
        bloc.add(FinishHiring(projectId: projectId));

        // Project by Id
        when(mockGetProjectByIdUsecase.call(projectId))
            .thenAnswer((_) async => Right(projectLst.first));
        bloc.add(GetProjectByID(projectId: projectId));

        // Complete Task
        final taskDto =
            CompleteTaskParams(taskId: const Uuid().v4(), projectId: projectId);
        when(mockCompleteTaskUsecase.call(taskDto))
            .thenAnswer((_) async => Right(task.first));
        bloc.add(CompleteTask(params: taskDto));

        // Create Task
        final createTaskDto = CreateTaskReqDto(
          projectId: projectId,
          taskName: "taskName",
          taskDescription: "taskDescription",
          deadline: DateTime.now(),
          members: [userId],
        );
        when(mockCreateTaskUsecase.call(createTaskDto))
            .thenAnswer((_) async => Right(task.first));
        bloc.add(CreateTask(dto: createTaskDto));

        // Project by User
        when(mockGetProjectsUserUsecase.call(userId))
            .thenAnswer((_) async => Right(projectLst));
        bloc.add(GetProjectByUser(uid: userId));

        // Applied Projects User
        when(mockGetAppliedProjectsUsecase.call(userId))
            .thenAnswer((_) async => Right(projectLst));
        bloc.add(GetAppliedProject(uid: userId));

        // Add Review
        final reviewDto = AddReviewReqDto(
          projectId: const Uuid().v4(),
          reviews: [Reviews.initial().fromDomain()],
        );
        when(mockAddReviewUsecase.call(reviewDto))
            .thenAnswer((_) async => Right(reviewLst));
        bloc.add(AddReview(dto: reviewDto));

        // Complete Project
        final completeProjectDto = CompleteProjectReqDto(
            completionType: CompletionType.delayed,
            projectId: const Uuid().v4());
        when(mockCompleteProjectUsecase.call(completeProjectDto)).thenAnswer(
            (_) async =>
                const Right('Project and all tasks completed successfully'));
        bloc.add(CompleteProject(dto: completeProjectDto));

        // Review by Id
        when(mockGetReviewByIdUsecase.call(reviewId))
            .thenAnswer((_) async => Right(reviewLst.first));
        bloc.add(GetReviewById(reviewId: reviewId));

        // Create Project
        final createDto = CreateProjectReqDto(
          projectName: 'projectName',
          companyName: 'companyName',
          position: 'position',
          address: 'address',
          postedBy: const Uuid().v4(),
          skills: ['skill1', 'skill2'],
          site: 'site',
          salary: Salary.initial(),
        );
        when(mockCreateProjectUsecase.call(createDto))
            .thenAnswer((_) async => Right(projectLst.first));
        bloc.add(CreateProject(dto: createDto));

        // Explore Project
        when(mockGetExploreProjectUsecase.call(userId))
            .thenAnswer((_) async => Right(projectLst));
        bloc.add(GetExploreProjects(uid: userId));

        // Apply Project
        final applyDto =
            ApplyProjectReqDto(userId: userId, projectId: projectId);
        when(mockApplyToProjectUsecase.call(applyDto))
            .thenAnswer((_) async => Right(projectLst.first));
        bloc.add(ApplyToProject(dto: applyDto));
      },
      expect: () => [
        isA<GetProjectLoading>(),
        isA<GetHireProjectSuccess>(),
        isA<GetProjectLoading>(),
        isA<GetActiveProjectSuccess>(),
        isA<GetProjectLoading>(),
        isA<GetCompletedProjectSuccess>(),
        isA<AcceptingUserLoading>(),
        isA<HireUserFailed>(),
        isA<AcceptingUserLoading>(),
        isA<RejectUserFailed>(),
        isA<FinishHireLoading>(),
        isA<FinishHireSuccess>(),
        isA<GetProjectLoading>(),
        isA<GetProjectByIdSuccess>(),
        isA<CompleteTaskLoading>(),
        isA<CompleteTaskFailed>(),
        isA<CreateTaskLoading>(),
        isA<CreateTaskSuccess>(),
        isA<GetProjectByUserLoading>(),
        isA<GetProjectByUserSuccess>(),
        isA<GetAppliedProjectLoading>(),
        isA<GetAppliedProjectSuccess>(),
        isA<AddReviewLoading>(),
        isA<AddReviewSuccess>(),
        isA<CompleteProjectLoading>(),
        isA<CompleteProjectSuccess>(),
        isA<GetReviewByIdLoading>(),
        isA<GetReviewByIdSuccess>(),
        isA<CreateProjectLoading>(),
        isA<CreateProjectSuccess>(),
        isA<GetExploreProjectsLoading>(),
        isA<GetExploreProjectsSuccess>(),
        isA<ApplyToProjectLoading>(),
        isA<ApplyToProjectSuccess>(),
      ],
    );
  });
}
