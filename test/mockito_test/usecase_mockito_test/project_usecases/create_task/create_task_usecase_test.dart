import 'package:cosphere/src/core/error/failure.dart';
import 'package:cosphere/src/features/project/data/dto/create_task/create_task_req_dto.dart';
import 'package:cosphere/src/features/project/domain/entities/tasks.dart';
import 'package:cosphere/src/features/project/domain/repositories/project_repository.dart';
import 'package:cosphere/src/features/project/domain/usecases/create_task_usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:uuid/uuid.dart';

import 'create_task_usecase_test.mocks.dart';

@GenerateMocks([ProjectRepository])
void main() {
  late MockProjectRepository mockProjectRepository;
  late CreateTaskUsecase createTaskUsecase;

  setUp(() {
    mockProjectRepository = MockProjectRepository();
    createTaskUsecase =
        CreateTaskUsecase(projectRepository: mockProjectRepository);
  });

  final dto = CreateTaskReqDto(
    projectId: const Uuid().v4(),
    taskName: 'taskName',
    taskDescription: 'taskDescription',
    deadline: DateTime.now(),
    members: [const Uuid().v4(), const Uuid().v4()],
  );
  test('should return the task after adding the task to database', () async {
    final task = Tasks.initial();

    when(mockProjectRepository.createTask(dto))
        .thenAnswer((_) async => Right(task));

    final result = await createTaskUsecase(dto);

    expect(result, Right(task));
    verify(mockProjectRepository.createTask(dto)).called(1);
    verifyNoMoreInteractions(mockProjectRepository);
  });

  test('should return Failure when an error occurs', () async {
    const failure =
        Failure(message: "Tasks can only be assigned to members of project.");

    when(mockProjectRepository.createTask(dto))
        .thenAnswer((_) async => const Left(failure));

    final result = await createTaskUsecase(dto);

    expect(result, const Left(failure));
    verify(mockProjectRepository.createTask(dto)).called(1);
    verifyNoMoreInteractions(mockProjectRepository);
  });
}
