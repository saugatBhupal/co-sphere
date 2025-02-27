import 'package:cosphere/src/core/error/failure.dart';
import 'package:cosphere/src/features/profile/data/dto/experience/get_experience_res_dto.dart';
import 'package:cosphere/src/features/profile/data/models/remote/experience_api_model.dart';
import 'package:cosphere/src/features/profile/domain/repositories/profile_repository.dart';
import 'package:cosphere/src/features/profile/domain/usecases/get_experience_by_userID_usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'get_experience_by_userID_usecase_test.mocks.dart';

@GenerateMocks([ProfileRepository])
void main() {
  late MockProfileRepository mockProfileRepository;
  late GetExperienceByUserIDUsecase getExperienceByUserIDUsecase;
  setUp(() {
    mockProfileRepository = MockProfileRepository();
    getExperienceByUserIDUsecase =
        GetExperienceByUserIDUsecase(profileRepository: mockProfileRepository);
  });
  test('should return List of Experience when correct user ID is provided',
      () async {
    // Arrange
    const userId = '123';

    final experienceList = [
      ExperienceApiModel(
        id: 'exp1',
        position: 'Software Engineer',
        organization: 'Tech Corp',
        status: 'Intern',
        from: DateTime.now(),
        to: DateTime.now(),
      ),
      ExperienceApiModel(
        id: 'exp2',
        position: 'Backend Developer',
        organization: 'Dev Solutions',
        status: 'Associate',
        from: DateTime.now(),
        to: DateTime.now(),
      ),
    ];
    final GetExperienceResDto resDto = GetExperienceResDto(
      overview: '5 years of experience in software development',
      experience: experienceList,
    );
    when(mockProfileRepository.getExperienceByUserID(userId))
        .thenAnswer((_) async => Right(resDto));

    // Act
    final result = await getExperienceByUserIDUsecase(userId);

    // Assert
    expect(result, Right(resDto));
    verify(mockProfileRepository.getExperienceByUserID(userId)).called(1);
    verifyNoMoreInteractions(mockProfileRepository);
  });
  test('should return Failure when an error occurs', () async {
    // Arrange
    const userId = '123';
    const failure = Failure(message: "User not found");

    when(mockProfileRepository.getExperienceByUserID(userId))
        .thenAnswer((_) async => const Left(failure));

    // Act
    final result = await getExperienceByUserIDUsecase.call(userId);

    // Assert
    expect(result, const Left(failure));
    verify(mockProfileRepository.getExperienceByUserID(userId)).called(1);
    verifyNoMoreInteractions(mockProfileRepository);
  });
}
