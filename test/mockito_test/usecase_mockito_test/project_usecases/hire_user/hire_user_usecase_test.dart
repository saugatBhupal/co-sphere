import 'package:cosphere/src/core/error/failure.dart';
import 'package:cosphere/src/features/jobs/domain/entities/applicants.dart';
import 'package:cosphere/src/features/project/data/dto/hire_user/hire_user_req_dto.dart';
import 'package:cosphere/src/features/project/domain/repositories/project_repository.dart';
import 'package:cosphere/src/features/project/domain/usecases/hire_user_usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:uuid/uuid.dart';

import 'hire_user_usecase_test.mocks.dart';

@GenerateMocks([ProjectRepository])
void main() {
  late MockProjectRepository mockProjectRepository;
  late HireUserUsecase hireUserUsecase;

  setUp(() {
    mockProjectRepository = MockProjectRepository();
    hireUserUsecase = HireUserUsecase(projectRepository: mockProjectRepository);
  });

  final dto =
      HireUserReqDto(userId: const Uuid().v4(), projectId: const Uuid().v4());

  test('should return the applicant who is hired', () async {
    final applicant = Applicants.initial();

    when(mockProjectRepository.hireUser(dto))
        .thenAnswer((_) async => Right(applicant));

    final result = await hireUserUsecase(dto);

    expect(result, Right(applicant));
    verify(mockProjectRepository.hireUser(dto)).called(1);
    verifyNoMoreInteractions(mockProjectRepository);
  });

  test('should return Failure when an error occurs', () async {
    const failure = Failure(message: "User did not apply to this project");

    when(mockProjectRepository.hireUser(dto))
        .thenAnswer((_) async => const Left(failure));

    final result = await hireUserUsecase(dto);

    expect(result, const Left(failure));
    verify(mockProjectRepository.hireUser(dto)).called(1);
    verifyNoMoreInteractions(mockProjectRepository);
  });
}
