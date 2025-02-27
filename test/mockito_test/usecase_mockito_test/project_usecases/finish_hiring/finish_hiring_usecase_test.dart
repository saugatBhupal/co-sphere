import 'package:cosphere/src/core/error/failure.dart';
import 'package:cosphere/src/features/project/domain/repositories/project_repository.dart';
import 'package:cosphere/src/features/project/domain/usecases/finish_hiring_usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:uuid/uuid.dart';

import 'finish_hiring_usecase_test.mocks.dart';

@GenerateMocks([ProjectRepository])
void main() {
  late MockProjectRepository mockProjectRepository;
  late FinishHiringUsecase finishHiringUsecase;

  setUp(() {
    mockProjectRepository = MockProjectRepository();
    finishHiringUsecase =
        FinishHiringUsecase(projectRepository: mockProjectRepository);
  });

  final projectId = const Uuid().v4();
  test('should return the success message after finish hiring', () async {
    const success = 'Hiring has completed. Project moved to active';

    when(mockProjectRepository.finishHiring(projectId))
        .thenAnswer((_) async => const Right(success));

    final result = await finishHiringUsecase(projectId);

    expect(result, const Right(success));
    verify(mockProjectRepository.finishHiring(projectId)).called(1);
    verifyNoMoreInteractions(mockProjectRepository);
  });

  test('should return Failure when an error occurs', () async {
    const failure = Failure(
        message: "Cannot finish hiring process without atleast 1 member.");

    when(mockProjectRepository.finishHiring(projectId))
        .thenAnswer((_) async => const Left(failure));

    final result = await finishHiringUsecase(projectId);

    expect(result, const Left(failure));
    verify(mockProjectRepository.finishHiring(projectId)).called(1);
    verifyNoMoreInteractions(mockProjectRepository);
  });
}
