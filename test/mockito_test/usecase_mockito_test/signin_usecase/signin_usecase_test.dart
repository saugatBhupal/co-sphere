import 'package:cosphere/src/core/domain/entities/user.dart';
import 'package:cosphere/src/core/error/failure.dart';
import 'package:cosphere/src/features/authentication/data/dto/sign_in/sign_in_request_dto.dart';
import 'package:cosphere/src/features/authentication/domain/repositories/auth_repository.dart';
import 'package:cosphere/src/features/authentication/domain/usecases/signin_usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'signin_usecase_test.mocks.dart';

@GenerateMocks([AuthRepository])
void main() {
  late SigninUsecase signinUsecase;
  late MockAuthRepository mockAuthRepository;

  setUp(() {
    mockAuthRepository = MockAuthRepository();
    signinUsecase = SigninUsecase(authRepository: mockAuthRepository);
  });

  test('should return user entity when Login is successful', () async {
    // Arrange
    const signinDto =
        SigninRequestDto(email: "test@gmail.com", password: "test@123");
    final user = User.initial().copyWith(
      email: "test@gmail.com",
      fullname: "test user",
      verified: true,
      country: "Nepal",
      phone: "1234567890",
    );
    when(mockAuthRepository.signin(signinDto))
        .thenAnswer((_) async => Right(user));

    // Act
    final result = await signinUsecase.call(signinDto);

    // Assert
    expect(result, Right(user));
    verify(mockAuthRepository.signin(signinDto)).called(1);
    verifyNoMoreInteractions(mockAuthRepository);
  });
  test('should return failure when login verification fails', () async {
    // Arrange
    const signinDto =
        SigninRequestDto(email: "test@gmail.com", password: "test@123");
    const failure = Failure(message: "Invalid Credentials");

    when(mockAuthRepository.signin(signinDto))
        .thenAnswer((_) async => const Left(failure));

    // Act
    final result = await signinUsecase.call(signinDto);

    // Assert
    expect(result, const Left(failure));
    verify(mockAuthRepository.signin(signinDto)).called(1);
    verifyNoMoreInteractions(mockAuthRepository);
  });
}
