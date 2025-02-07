import 'package:cosphere/src/core/error/failure.dart';
import 'package:cosphere/src/features/profile/domain/entities/education.dart';
import 'package:cosphere/src/features/profile/domain/repositories/profile_repository.dart';
import 'package:cosphere/src/features/profile/domain/usecases/get_education_by_userID_usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'get_education_by_userID_usecase_test.mocks.dart';

@GenerateMocks([ProfileRepository])
void main() {
  late MockProfileRepository mockProfileRepository;
  late GetEducationByUserIDUsecase getEducationByUserIDUsecase;

  setUp(() {
    mockProfileRepository = MockProfileRepository();
    getEducationByUserIDUsecase =
        GetEducationByUserIDUsecase(profileRepository: mockProfileRepository);
  });

  test('should return List of Education when correct user ID is provided',
      () async {
    const uid = '123';

    final educationLst = [
      Education.initial(),
      Education.initial(),
      Education.initial(),
    ];
    when(mockProfileRepository.getEducationByUserID(uid))
        .thenAnswer((_) async => Right(educationLst));
    final result = await getEducationByUserIDUsecase(uid);

    // Assert
    expect(result, Right(educationLst));
    verify(mockProfileRepository.getEducationByUserID(uid)).called(1);
    verifyNoMoreInteractions(mockProfileRepository);
  });
  test('should return Failure when an error occurs', () async {
    // Arrange
    const uid = '123';
    const failure = Failure(message: "User not found");

    when(mockProfileRepository.getEducationByUserID(uid))
        .thenAnswer((_) async => const Left(failure));

    // Act
    final result = await getEducationByUserIDUsecase.call(uid);

    // Assert
    expect(result, const Left(failure));
    verify(mockProfileRepository.getEducationByUserID(uid)).called(1);
    verifyNoMoreInteractions(mockProfileRepository);
  });
}
