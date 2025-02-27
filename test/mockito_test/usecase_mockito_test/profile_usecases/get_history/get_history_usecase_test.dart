import 'package:cosphere/src/core/error/failure.dart';
import 'package:cosphere/src/features/profile/domain/repositories/profile_repository.dart';
import 'package:cosphere/src/features/profile/domain/usecases/get_history_by_user_id_usecase.dart';
import 'package:cosphere/src/features/project/domain/entities/project.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:uuid/uuid.dart';

import 'get_history_usecase_test.mocks.dart';

@GenerateMocks([ProfileRepository])
void main() {
  late MockProfileRepository mockProfileRepository;
  late GetHistoryByUserIdUsecase getHistoryByUserIdUsecase;

  setUp(() {
    mockProfileRepository = MockProfileRepository();
    getHistoryByUserIdUsecase =
        GetHistoryByUserIdUsecase(profileRepository: mockProfileRepository);
  });

  final userId = const Uuid().v4();
  test('should return List of all project worked on by the user', () async {
    final projectLst = [Project.initial(), Project.initial()];

    when(mockProfileRepository.getHistoryByUserId(userId))
        .thenAnswer((_) async => Right(projectLst));

    final result = await getHistoryByUserIdUsecase(userId);

    expect(result, Right(projectLst));
    verify(mockProfileRepository.getHistoryByUserId(userId)).called(1);
    verifyNoMoreInteractions(mockProfileRepository);
  });

  test('should return Failure when an error occurs', () async {
    const failure = Failure(message: "User not found");

    when(mockProfileRepository.getHistoryByUserId(userId))
        .thenAnswer((_) async => const Left(failure));

    final result = await getHistoryByUserIdUsecase(userId);

    expect(result, const Left(failure));
    verify(mockProfileRepository.getHistoryByUserId(userId)).called(1);
    verifyNoMoreInteractions(mockProfileRepository);
  });
}
