import 'package:cosphere/src/core/error/failure.dart';
import 'package:cosphere/src/features/project/domain/entities/project.dart';
import 'package:cosphere/src/features/project/domain/repositories/project_repository.dart';
import 'package:cosphere/src/features/project/domain/usecases/get_projects_user_usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:uuid/uuid.dart';

import 'get_project_by_user_usecase_test.mocks.dart';

@GenerateMocks([ProjectRepository])
void main() {
  late MockProjectRepository mockProjectRepository;
  late GetProjectsUserUsecase getProjectsUserUsecase;

  setUp(() {
    mockProjectRepository = MockProjectRepository();
    getProjectsUserUsecase =
        GetProjectsUserUsecase(projectRepository: mockProjectRepository);
  });

  final userId = const Uuid().v4();
  test('should return List of all project created by the user', () async {
    final projectLst = [Project.initial(), Project.initial()];

    when(mockProjectRepository.getProjectsByUser(userId))
        .thenAnswer((_) async => Right(projectLst));

    final result = await getProjectsUserUsecase(userId);

    expect(result, Right(projectLst));
    verify(mockProjectRepository.getProjectsByUser(userId)).called(1);
    verifyNoMoreInteractions(mockProjectRepository);
  });

  test('should return Failure when an error occurs', () async {
    const failure = Failure(message: "User not found");

    when(mockProjectRepository.getProjectsByUser(userId))
        .thenAnswer((_) async => const Left(failure));

    final result = await getProjectsUserUsecase(userId);

    expect(result, const Left(failure));
    verify(mockProjectRepository.getProjectsByUser(userId)).called(1);
    verifyNoMoreInteractions(mockProjectRepository);
  });
}
