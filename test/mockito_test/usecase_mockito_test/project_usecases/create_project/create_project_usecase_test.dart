import 'package:cosphere/src/core/error/failure.dart';
import 'package:cosphere/src/features/jobs/domain/entities/salary.dart';
import 'package:cosphere/src/features/project/data/dto/create_project/create_project_req_dto.dart';
import 'package:cosphere/src/features/project/domain/entities/durations.dart';
import 'package:cosphere/src/features/project/domain/entities/project.dart';
import 'package:cosphere/src/features/project/domain/repositories/project_repository.dart';
import 'package:cosphere/src/features/project/domain/usecases/create_project_usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:uuid/uuid.dart';

import 'create_project_usecase_test.mocks.dart';

@GenerateMocks([ProjectRepository])
void main() {
  late MockProjectRepository mockProjectRepository;
  late CreateProjectUsecase createProjectUsecase;

  setUp(() {
    mockProjectRepository = MockProjectRepository();
    createProjectUsecase =
        CreateProjectUsecase(projectRepository: mockProjectRepository);
  });

  final dto = CreateProjectReqDto(
    projectName: 'projectName',
    companyName: 'companyName',
    position: 'position',
    address: 'address',
    postedBy: const Uuid().v4(),
    skills: ['skill1', 'skill2'],
    site: 'site',
    description: 'description',
    salary: Salary.initial(),
    duration: DurationTime.initial()
  );
  test('should return the project after adding the project to database',
      () async {
    final project = Project.initial();

    when(mockProjectRepository.createProject(dto))
        .thenAnswer((_) async => Right(project));

    final result = await createProjectUsecase(dto);

    expect(result, Right(project));
    verify(mockProjectRepository.createProject(dto)).called(1);
    verifyNoMoreInteractions(mockProjectRepository);
  });

  test('should return Failure when an error occurs', () async {
    const failure = Failure(message: "Missing required fields");

    when(mockProjectRepository.createProject(dto))
        .thenAnswer((_) async => const Left(failure));

    final result = await createProjectUsecase(dto);

    expect(result, const Left(failure));
    verify(mockProjectRepository.createProject(dto)).called(1);
    verifyNoMoreInteractions(mockProjectRepository);
  });
}
