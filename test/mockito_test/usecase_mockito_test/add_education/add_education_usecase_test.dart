import 'package:cosphere/src/core/error/failure.dart';
import 'package:cosphere/src/features/profile/data/dto/education/add_education_req_dto.dart';
import 'package:cosphere/src/features/profile/domain/entities/education.dart';
import 'package:cosphere/src/features/profile/domain/repositories/profile_repository.dart';
import 'package:cosphere/src/features/profile/domain/usecases/add_education_usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'add_education_usecase_test.mocks.dart';

@GenerateMocks([ProfileRepository])
void main() {
  late MockProfileRepository mockProfileRepository;
  late AddEducationUsecase addEducationUsecase;

  setUp(() {
    mockProfileRepository = MockProfileRepository();
    addEducationUsecase =
        AddEducationUsecase(profileRepository: mockProfileRepository);
  });

  final reqDto = AddEducationReqDto(
    email: "test@gmail.com",
    degree: "testDegree",
    organization: "testOrganization",
    from: DateTime.now(),
    to: DateTime.now(),
  );
  test('should return user entity when Login is successful', () async {
    // Arrange

    when(mockProfileRepository.addEducation(reqDto))
        .thenAnswer((_) async => Right(Education.initial()));
    // Act
    final result = await addEducationUsecase.call(reqDto);
    // Assert
    expect(result, Right(Education.initial()));
    verify(mockProfileRepository.addEducation(reqDto)).called(1);
    verifyNoMoreInteractions(mockProfileRepository);
  });

  test('should return Failure when an User is not found', () async {
    // Arrange
    const failure = Failure(message: "User not found");

    when(mockProfileRepository.addEducation(reqDto))
        .thenAnswer((_) async => const Left(failure));

    // Act
    final result = await addEducationUsecase.call(reqDto);

    // Assert
    expect(result, const Left(failure));
    verify(mockProfileRepository.addEducation(reqDto)).called(1);
    verifyNoMoreInteractions(mockProfileRepository);
  });
}
