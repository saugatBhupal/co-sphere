import 'package:cosphere/src/core/error/failure.dart';
import 'package:cosphere/src/features/profile/data/dto/experience/add_experience_req_dto.dart';
import 'package:cosphere/src/features/profile/domain/entities/experience.dart';
import 'package:cosphere/src/features/profile/domain/repositories/profile_repository.dart';
import 'package:cosphere/src/features/profile/domain/usecases/add_experience_usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'add_experience_usecase_test.mocks.dart';

@GenerateMocks([ProfileRepository])
void main() {
  late MockProfileRepository mockProfileRepository;
  late AddExperienceUsecase addExperienceUsecase;

  setUp(() {
    mockProfileRepository = MockProfileRepository();
    addExperienceUsecase =
        AddExperienceUsecase(profileRepository: mockProfileRepository);
  });
  final reqDto = AddExperienceReqDto(
    email: "test@gmail.com",
    position: "testPosition",
    organization: "testOrganization",
    status: "testStatus",
    from: DateTime.now(),
    to: DateTime.now(),
  );

  test('should return Experience entity when experience is added successfully',
      () async {
    // Arrange

    when(mockProfileRepository.addExperience(reqDto))
        .thenAnswer((_) async => Right(Experience.initial()));
    // Act
    final result = await addExperienceUsecase.call(reqDto);
    // Assert
    expect(result, Right(Experience.initial()));
    verify(mockProfileRepository.addExperience(reqDto)).called(1);
    verifyNoMoreInteractions(mockProfileRepository);
  });
  test('should return Failure when an User is not found', () async {
    // Arrange
    const failure = Failure(message: "User not found");
    when(mockProfileRepository.addExperience(reqDto))
        .thenAnswer((_) async => const Left(failure));
    // Act
    final result = await addExperienceUsecase.call(reqDto);
    // Assert
    expect(result, const Left(failure));
    verify(mockProfileRepository.addExperience(reqDto)).called(1);
    verifyNoMoreInteractions(mockProfileRepository);
  });
}
