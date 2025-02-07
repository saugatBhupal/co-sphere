import 'package:cosphere/src/core/error/failure.dart';
import 'package:cosphere/src/features/authentication/data/dto/sign_up/sign_up_request_dto.dart';
import 'package:cosphere/src/features/authentication/domain/repositories/auth_repository.dart';
import 'package:cosphere/src/features/authentication/domain/usecases/signup_usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'signup_usecase_test.mocks.dart';

@GenerateMocks([AuthRepository])
void main() {
  late SignupUsecase signupUsecase;
  late MockAuthRepository mockAuthRepository;

  setUp(() {
    mockAuthRepository = MockAuthRepository();
    signupUsecase = SignupUsecase(authRepository: mockAuthRepository);
  });

  test('should return success message when signup is successful', () async {
    final requestDto = SignUpRequestDto.initial();
    const successMessage = 'Signup Successful';
    when(mockAuthRepository.signup(any))
        .thenAnswer((_) async => const Right(successMessage));

    // Act
    final result = await signupUsecase(requestDto);

    // Assert
    expect(result, const Right(successMessage));

    // Verify
    verify(mockAuthRepository.signup(requestDto)).called(1);
    verifyNoMoreInteractions(mockAuthRepository);
  });

  test('should return Failure when signup fails', () async {
    final requestDto = SignUpRequestDto.initial();
    const failure = Failure(message: "Sign up Failure");
    when(mockAuthRepository.signup(any))
        .thenAnswer((_) async => const Left(failure));

    // Act
    final result = await signupUsecase(requestDto);

    // Assert
    expect(result, const Left(failure));

    // Verify
    verify(mockAuthRepository.signup(requestDto)).called(1);
    verifyNoMoreInteractions(mockAuthRepository);
  });
}
