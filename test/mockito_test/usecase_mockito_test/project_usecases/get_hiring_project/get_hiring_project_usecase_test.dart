import 'package:cosphere/src/core/error/failure.dart';
import 'package:cosphere/src/features/project/domain/entities/project.dart';
import 'package:cosphere/src/features/project/domain/repositories/project_repository.dart';
import 'package:cosphere/src/features/project/domain/usecases/get_hiring_projects_user_usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:uuid/uuid.dart';

import 'get_hiring_project_usecase_test.mocks.dart';

@GenerateMocks([ProjectRepository])
void main() {
  late MockProjectRepository mockProjectRepository;
  late GetHiringProjectsUserUsecase getHiringProjectsUserUsecase;

  setUp(() {
    mockProjectRepository = MockProjectRepository();
    getHiringProjectsUserUsecase =
        GetHiringProjectsUserUsecase(projectRepository: mockProjectRepository);
  });

  final userId = const Uuid().v4();
  test('should return List of project created by the user currently hiring',
      () async {
    final projectLst = [Project.initial(), Project.initial()];

    when(mockProjectRepository.getHiringProjectsByUser(userId))
        .thenAnswer((_) async => Right(projectLst));

    final result = await getHiringProjectsUserUsecase(userId);

    expect(result, Right(projectLst));
    verify(mockProjectRepository.getHiringProjectsByUser(userId)).called(1);
    verifyNoMoreInteractions(mockProjectRepository);
  });

  test('should return Failure when an error occurs', () async {
    const failure = Failure(message: "User not found");

    when(mockProjectRepository.getHiringProjectsByUser(userId))
        .thenAnswer((_) async => const Left(failure));

    final result = await getHiringProjectsUserUsecase(userId);

    expect(result, const Left(failure));
    verify(mockProjectRepository.getHiringProjectsByUser(userId)).called(1);
    verifyNoMoreInteractions(mockProjectRepository);
  });
}
