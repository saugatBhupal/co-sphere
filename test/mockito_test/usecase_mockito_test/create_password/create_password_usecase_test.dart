import 'package:cosphere/src/core/error/failure.dart';
import 'package:cosphere/src/features/authentication/data/dto/create_password/create_password_request_dto.dart';
import 'package:cosphere/src/features/authentication/domain/repositories/auth_repository.dart';
import 'package:cosphere/src/features/authentication/domain/usecases/create_password_usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'create_password_usecase_test.mocks.dart';

@GenerateMocks([AuthRepository])
void main() {
  late CreatePasswordUsecase createPasswordUsecase;
  late MockAuthRepository mockAuthRepository;

  setUp(() {
    mockAuthRepository = MockAuthRepository();
    createPasswordUsecase =
        CreatePasswordUsecase(authRepository: mockAuthRepository);
  });
  test('should return success message when password is successful', () async {
    final requestDto =
        CreatePasswordRequestDto(email: 'test@gmail.com', password: 'test@123');
    const successMessage = 'Password Created Successfully';
    when(mockAuthRepository.createPassword(any))
        .thenAnswer((_) async => const Right(successMessage));
    // Act
    final result = await createPasswordUsecase(requestDto);

    // Assert
    expect(result, const Right(successMessage));

    // Verify
    verify(mockAuthRepository.createPassword(requestDto)).called(1);
    verifyNoMoreInteractions(mockAuthRepository);
  });

  test('should return Failure when the Email is incorrect', () async {
    // Arrange
    final requestDto = CreatePasswordRequestDto(
        email: 'test123@gmail.com', password: 'test@123');
    const failure = Failure(message: "Email does not exist");

    when(mockAuthRepository.createPassword(requestDto))
        .thenAnswer((_) async => const Left(failure));
    // Act
    final result = await createPasswordUsecase.call(requestDto);

    // Assert
    expect(result, const Left(failure));
    verify(mockAuthRepository.createPassword(requestDto)).called(1);
    verifyNoMoreInteractions(mockAuthRepository);
  });
}
