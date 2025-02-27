import 'package:cosphere/src/core/error/failure.dart';
import 'package:cosphere/src/features/project/domain/entities/tasks.dart';
import 'package:cosphere/src/features/project/domain/repositories/project_repository.dart';
import 'package:cosphere/src/features/project/domain/usecases/complete_task_usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:uuid/uuid.dart';

import 'complete_task_usecase_test.mocks.dart';

@GenerateMocks([ProjectRepository])
void main() {
  late MockProjectRepository mockProjectRepository;
  late CompleteTaskUsecase completeTaskUsecase;

  setUp(() {
    mockProjectRepository = MockProjectRepository();
    completeTaskUsecase =
        CompleteTaskUsecase(projectRepository: mockProjectRepository);
  });

  final dto = CompleteTaskParams(
      taskId: const Uuid().v4(), projectId: const Uuid().v4());
  test('should return the task after completion', () async {
    final task = Tasks.initial();

    when(mockProjectRepository.completeTask(dto))
        .thenAnswer((_) async => Right(task));

    final result = await completeTaskUsecase(dto);

    expect(result, Right(task));
    verify(mockProjectRepository.completeTask(dto)).called(1);
    verifyNoMoreInteractions(mockProjectRepository);
  });

  test('should return Failure when an error occurs', () async {
    const failure = Failure(message: "Task not found");

    when(mockProjectRepository.completeTask(dto))
        .thenAnswer((_) async => const Left(failure));

    final result = await completeTaskUsecase(dto);

    expect(result, const Left(failure));
    verify(mockProjectRepository.completeTask(dto)).called(1);
    verifyNoMoreInteractions(mockProjectRepository);
  });
}
