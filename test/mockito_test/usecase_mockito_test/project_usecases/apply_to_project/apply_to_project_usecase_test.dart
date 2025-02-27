import 'package:cosphere/src/core/error/failure.dart';
import 'package:cosphere/src/features/project/data/dto/apply_project/apply_project_req_dto.dart';
import 'package:cosphere/src/features/project/domain/entities/project.dart';
import 'package:cosphere/src/features/project/domain/repositories/project_repository.dart';
import 'package:cosphere/src/features/project/domain/usecases/apply_to_project_usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:uuid/uuid.dart';

import 'apply_to_project_usecase_test.mocks.dart';

@GenerateMocks([ProjectRepository])
void main() {
  late MockProjectRepository mockProjectRepository;
  late ApplyToProjectUsecase applyToProjectUsecase;

  setUp(() {
    mockProjectRepository = MockProjectRepository();
    applyToProjectUsecase =
        ApplyToProjectUsecase(projectRepository: mockProjectRepository);
  });

  final dto = ApplyProjectReqDto(
      userId: const Uuid().v4(), projectId: const Uuid().v4());
  test('should return the applied project', () async {
    final project = Project.initial();

    when(mockProjectRepository.applyToProject(dto))
        .thenAnswer((_) async => Right(project));

    final result = await applyToProjectUsecase(dto);

    expect(result, Right(project));
    verify(mockProjectRepository.applyToProject(dto)).called(1);
    verifyNoMoreInteractions(mockProjectRepository);
  });

  test('should return Failure when an error occurs', () async {
    const failure = Failure(message: "Failed to apply to project");

    when(mockProjectRepository.applyToProject(dto))
        .thenAnswer((_) async => const Left(failure));

    final result = await applyToProjectUsecase(dto);

    expect(result, const Left(failure));
    verify(mockProjectRepository.applyToProject(dto)).called(1);
    verifyNoMoreInteractions(mockProjectRepository);
  });
}
