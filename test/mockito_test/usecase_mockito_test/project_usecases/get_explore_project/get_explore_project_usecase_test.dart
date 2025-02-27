import 'package:cosphere/src/core/error/failure.dart';
import 'package:cosphere/src/features/project/domain/entities/project.dart';
import 'package:cosphere/src/features/project/domain/repositories/project_repository.dart';
import 'package:cosphere/src/features/project/domain/usecases/get_explore_project_usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:uuid/uuid.dart';

import 'get_explore_project_usecase_test.mocks.dart';

@GenerateMocks([ProjectRepository])
void main() {
  late MockProjectRepository mockProjectRepository;
  late GetExploreProjectUsecase getExploreProjectUsecase;

  setUp(() {
    mockProjectRepository = MockProjectRepository();
    getExploreProjectUsecase =
        GetExploreProjectUsecase(projectRepository: mockProjectRepository);
  });

  final userId = const Uuid().v4();
  test('should return List of project for user to Apply', () async {
    final projectLst = [Project.initial(), Project.initial()];

    when(mockProjectRepository.getExploreProjects(userId))
        .thenAnswer((_) async => Right(projectLst));

    final result = await getExploreProjectUsecase(userId);

    expect(result, Right(projectLst));
    verify(mockProjectRepository.getExploreProjects(userId)).called(1);
    verifyNoMoreInteractions(mockProjectRepository);
  });

  test('should return Failure when an error occurs', () async {
    const failure = Failure(message: "User not found");

    when(mockProjectRepository.getExploreProjects(userId))
        .thenAnswer((_) async => const Left(failure));

    final result = await getExploreProjectUsecase(userId);

    expect(result, const Left(failure));
    verify(mockProjectRepository.getExploreProjects(userId)).called(1);
    verifyNoMoreInteractions(mockProjectRepository);
  });
}
