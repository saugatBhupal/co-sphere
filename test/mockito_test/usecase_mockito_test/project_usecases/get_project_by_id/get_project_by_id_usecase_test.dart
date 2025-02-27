import 'package:cosphere/src/core/error/failure.dart';
import 'package:cosphere/src/features/project/domain/entities/project.dart';
import 'package:cosphere/src/features/project/domain/repositories/project_repository.dart';
import 'package:cosphere/src/features/project/domain/usecases/get_project_by_id_usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:uuid/uuid.dart';

import 'get_project_by_id_usecase_test.mocks.dart';

@GenerateMocks([ProjectRepository])
void main() {
  late MockProjectRepository mockProjectRepository;
  late GetProjectByIdUsecase getProjectByIdUsecase;

  setUp(() {
    mockProjectRepository = MockProjectRepository();
    getProjectByIdUsecase =
        GetProjectByIdUsecase(projectRepository: mockProjectRepository);
  });

  final projectId = const Uuid().v4();
  test('should return project details', () async {
    final project = Project.initial();

    when(mockProjectRepository.getProjectById(projectId))
        .thenAnswer((_) async => Right(project));

    final result = await getProjectByIdUsecase(projectId);

    expect(result, Right(project));
    verify(mockProjectRepository.getProjectById(projectId)).called(1);
    verifyNoMoreInteractions(mockProjectRepository);
  });

  test('should return Failure when an error occurs', () async {
    const failure = Failure(message: "Project not found");

    when(mockProjectRepository.getProjectById(projectId))
        .thenAnswer((_) async => const Left(failure));

    final result = await getProjectByIdUsecase(projectId);

    expect(result, const Left(failure));
    verify(mockProjectRepository.getProjectById(projectId)).called(1);
    verifyNoMoreInteractions(mockProjectRepository);
  });
}
