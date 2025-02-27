import 'package:cosphere/src/core/constants/app_enums.dart';
import 'package:cosphere/src/core/error/failure.dart';
import 'package:cosphere/src/features/project/data/dto/complete_project/complete_project_req_dto.dart';
import 'package:cosphere/src/features/project/domain/repositories/project_repository.dart';
import 'package:cosphere/src/features/project/domain/usecases/complete_project_usecse.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:uuid/uuid.dart';

import 'complete_project_usecase_test.mocks.dart';

@GenerateMocks([ProjectRepository])
void main() {
  late MockProjectRepository mockProjectRepository;
  late CompleteProjectUsecase completeProjectUsecase;

  setUp(() {
    mockProjectRepository = MockProjectRepository();
    completeProjectUsecase =
        CompleteProjectUsecase(projectRepository: mockProjectRepository);
  });

  final dto = CompleteProjectReqDto(
      completionType: CompletionType.delayed, projectId: const Uuid().v4());
  test('should return the success message after project completed', () async {
    const success = 'Project and all tasks completed successfully';

    when(mockProjectRepository.completeProject(dto))
        .thenAnswer((_) async => Right(success));

    final result = await completeProjectUsecase(dto);

    expect(result, const Right(success));
    verify(mockProjectRepository.completeProject(dto)).called(1);
    verifyNoMoreInteractions(mockProjectRepository);
  });

  test('should return Failure when an error occurs', () async {
    const failure = Failure(
        message:
            "Completion type must be specified. Eg. On-Time, Delayed, Early");

    when(mockProjectRepository.completeProject(dto))
        .thenAnswer((_) async => const Left(failure));

    final result = await completeProjectUsecase(dto);

    expect(result, const Left(failure));
    verify(mockProjectRepository.completeProject(dto)).called(1);
    verifyNoMoreInteractions(mockProjectRepository);
  });
}
