import 'package:bloc_test/bloc_test.dart';
import 'package:cosphere/src/core/domain/entities/user.dart';
import 'package:cosphere/src/features/jobs/domain/entities/job.dart';
import 'package:cosphere/src/features/project/domain/entities/project.dart';
import 'package:cosphere/src/features/search/data/dto/add_search_history_req_dto/add_search_history_req_dto.dart';
import 'package:cosphere/src/features/search/domain/entities/search.dart';
import 'package:cosphere/src/features/search/domain/usecases/add_search_history_usecase.dart';
import 'package:cosphere/src/features/search/domain/usecases/get_jobs_by_name_usecase.dart';
import 'package:cosphere/src/features/search/domain/usecases/get_project_by_name_usecase.dart';
import 'package:cosphere/src/features/search/domain/usecases/get_search_history_usecase.dart';
import 'package:cosphere/src/features/search/domain/usecases/get_users_by_name_usecase.dart';
import 'package:cosphere/src/features/search/presentation/viewmodels/search_bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:uuid/uuid.dart';

import 'search_viewmodel_test.mocks.dart';

@GenerateNiceMocks([
  MockSpec<AddSearchHistoryUsecase>(),
  MockSpec<GetJobsByNameUsecase>(),
  MockSpec<GetProjectByNameUsecase>(),
  MockSpec<GetSearchHistoryUsecase>(),
  MockSpec<GetUsersByNameUsecase>(),
])
void main() {
  group('SearchViewmodels', () {
    late AddSearchHistoryUsecase mockSearchHistoryUsecase;
    late GetJobsByNameUsecase mockGetJobsByNameUsecase;
    late GetProjectByNameUsecase mockGetProjectByNameUsecase;
    late GetSearchHistoryUsecase mockGetSearchHistoryUsecase;
    late GetUsersByNameUsecase mockGetUsersByNameUsecase;

    setUp(() {
      mockSearchHistoryUsecase = MockAddSearchHistoryUsecase();
      mockGetJobsByNameUsecase = MockGetJobsByNameUsecase();
      mockGetProjectByNameUsecase = MockGetProjectByNameUsecase();
      mockGetSearchHistoryUsecase = MockGetSearchHistoryUsecase();
      mockGetUsersByNameUsecase = MockGetUsersByNameUsecase();
    });

    blocTest<SearchBloc, SearchState>(
      'emits [MyState] when MyEvent is added',
      build: () => SearchBloc(
          getSearchHistoryUsecase: mockGetSearchHistoryUsecase,
          addSearchHistoryUsecase: mockSearchHistoryUsecase,
          getUsersByNameUsecase: mockGetUsersByNameUsecase,
          getJobsByNameUsecase: mockGetJobsByNameUsecase,
          getProjectByNameUsecase: mockGetProjectByNameUsecase),
      act: (bloc) async {
        // Get Search History
        final String uid = const Uuid().v4();
        final searchResults = [
          Search.initial(),
          Search.initial(),
          Search.initial(),
        ];
        when(mockGetSearchHistoryUsecase.call(uid))
            .thenAnswer((_) async => Right(searchResults));
        bloc.add(GetSearchHistory(uid: uid));

        // Add Search History
        final searchDto = AddSearchHistoryReqDto(
            userId: const Uuid().v4(), query: "Job Name");
        when(mockSearchHistoryUsecase.call(searchDto))
            .thenAnswer((_) async => const Right(null));
        bloc.add(AddSearchHistory(dto: searchDto));

        // Get User by Name
        const String username = "UserName";
        final userLst = [User.initial(), User.initial(), User.initial()];
        when(mockGetUsersByNameUsecase.call(username))
            .thenAnswer((_) async => Right(userLst));
        bloc.add(const GetUserByName(query: username));

        // Get Job by Job name
        const String jobName = "Job Name";
        final jobLst = [Job.initial(), Job.initial(), Job.initial()];
        when(mockGetJobsByNameUsecase.call(jobName))
            .thenAnswer((_) async => Right(jobLst));
        bloc.add(const GetJobByName(query: jobName));

        // Get Project by Project name
        const String projectName = "Project Name";
        final projectLst = [
          Project.initial(),
          Project.initial(),
          Project.initial()
        ];
        when(mockGetProjectByNameUsecase.call(projectName))
            .thenAnswer((_) async => Right(projectLst));
        bloc.add(const GetProjectByName(query: projectName));
      },
      expect: () => [
        isA<SearchHistoryLoading>(),
        isA<GetSearchHistorySuccess>(),
        isA<SearchHistoryLoading>(),
        isA<AddSearchHistorySuccess>(),
        isA<SearchHistoryLoading>(),
        isA<GetUserByNameSuccess>(),
        isA<SearchHistoryLoading>(),
        isA<GetJobByNameSuccess>(),
        isA<SearchHistoryLoading>(),
        isA<GetProjectByNameSuccess>(),
      ],
    );
  });
}
