import 'dart:io';
import 'package:cosphere/src/core/error/failure.dart';
import 'package:cosphere/src/features/profile/data/dto/profile_img/update_profile_imgage_req_dto.dart';
import 'package:cosphere/src/features/profile/domain/repositories/profile_repository.dart';
import 'package:cosphere/src/features/profile/domain/usecases/update_profile_image_usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'update_profile_image_usecase_test.mocks.dart';

@GenerateMocks([ProfileRepository])
void main() {
  late UpdateProfileImageUsecase updateProfileImageUsecase;
  late MockProfileRepository mockProfileRepository;

  setUp(() {
    mockProfileRepository = MockProfileRepository();
    updateProfileImageUsecase = UpdateProfileImageUsecase(
      profileRepository: mockProfileRepository,
    );
  });

  test('should return success message when image update is successful',
      () async {
    // Arrange
    const successMessage = "Profile image updated successfully";
    final testImageFile = File('test_resources/sample_image.jpg');
    final updateProfileImgReqDto = UpdateProfileImgageReqDto(
        media: testImageFile, email: "test@gmail.com");

    when(mockProfileRepository.updateProfileImage(updateProfileImgReqDto))
        .thenAnswer((_) async => const Right(successMessage));

    // Act
    final result = await updateProfileImageUsecase.call(updateProfileImgReqDto);

    // Assert
    expect(result, const Right(successMessage));
    verify(mockProfileRepository.updateProfileImage(updateProfileImgReqDto))
        .called(1);
    verifyNoMoreInteractions(mockProfileRepository);
  });

  test('should return failure when image update fails', () async {
    // Arrange
    const failure = Failure(message: "Failed to update profile image");
    final testImageFile = File('test_resources/sample_image.jpg');
    final updateProfileImgReqDto = UpdateProfileImgageReqDto(
        media: testImageFile, email: "test@gmail.com");

    when(mockProfileRepository.updateProfileImage(updateProfileImgReqDto))
        .thenAnswer((_) async => const Left(failure));

    // Act
    final result = await updateProfileImageUsecase.call(updateProfileImgReqDto);

    // Assert
    expect(result, const Left(failure));
    verify(mockProfileRepository.updateProfileImage(updateProfileImgReqDto))
        .called(1);
    verifyNoMoreInteractions(mockProfileRepository);
  });
}
