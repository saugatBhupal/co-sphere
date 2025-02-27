import 'package:cosphere/src/core/error/failure.dart';
import 'package:cosphere/src/features/project/domain/entities/project.dart';
import 'package:cosphere/src/features/search/domain/repositories/search_repository.dart';
import 'package:cosphere/src/features/search/domain/usecases/get_project_by_name_usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'get_project_by_name_usecase_test.mocks.dart';

@GenerateMocks([SearchRepository])
void main() {
  late MockSearchRepository mockSearchRepository;
  late GetProjectByNameUsecase getProjectByNameUsecase;

  setUp(() {
    mockSearchRepository = MockSearchRepository();
    getProjectByNameUsecase =
        GetProjectByNameUsecase(searchRepository: mockSearchRepository);
  });

  test('should return projects related to the query params', () async {
    final projectLst = [
      Project.initial(),
      Project.initial(),
      Project.initial()
    ];
    const String query = "ProjectName";

    when(mockSearchRepository.getProjectsByName(query))
        .thenAnswer((_) async => Right(projectLst));

    final result = await getProjectByNameUsecase(query);

    expect(result, Right(projectLst));
    verify(mockSearchRepository.getProjectsByName(query)).called(1);
    verifyNoMoreInteractions(mockSearchRepository);
  });

  test('should return Failure when an error occurs', () async {
    const String query = "ProjectName";
    const failure = Failure(message: "Invalid Request");

    when(mockSearchRepository.getProjectsByName(query))
        .thenAnswer((_) async => const Left(failure));

    final result = await getProjectByNameUsecase(query);
    
    expect(result, const Left(failure));
    verify(mockSearchRepository.getProjectsByName(query)).called(1);
    verifyNoMoreInteractions(mockSearchRepository);
  });
}
