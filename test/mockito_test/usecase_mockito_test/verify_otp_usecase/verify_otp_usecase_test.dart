import 'package:cosphere/src/core/constants/app_enums.dart';
import 'package:cosphere/src/core/error/failure.dart';
import 'package:cosphere/src/features/authentication/data/dto/otp/otp_request_dto.dart';
import 'package:cosphere/src/features/authentication/domain/usecases/verify_otp_usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:cosphere/src/features/authentication/domain/repositories/auth_repository.dart';
import 'package:mockito/mockito.dart';
import 'verify_otp_usecase_test.mocks.dart';

@GenerateMocks([AuthRepository])
void main() {
  late VerifyOtpUsecase verifyOtpUsecase;
  late MockAuthRepository mockAuthRepository;

  setUp(() {
    mockAuthRepository = MockAuthRepository();
    verifyOtpUsecase = VerifyOtpUsecase(authRepository: mockAuthRepository);
  });
  test('should return success message when OTP verification is successful',
      () async {
    // Arrange
    final otpRequest = OtpRequestDto(
        otp: '123456', type: OtpType.verifyUser, email: 'test@gmail.com');
    const successMessage = "OTP Verified Successfully";

    when(mockAuthRepository.verifyOTP(otpRequest))
        .thenAnswer((_) async => const Right(successMessage));

    // Act
    final result = await verifyOtpUsecase.call(otpRequest);

    // Assert
    expect(result, const Right(successMessage));
    verify(mockAuthRepository.verifyOTP(otpRequest)).called(1);
    verifyNoMoreInteractions(mockAuthRepository);
  });

  test('should return failure when OTP verification fails', () async {
    // Arrange
    final otpRequest = OtpRequestDto(
        otp: '000000', type: OtpType.verifyUser, email: 'test@gmail.com');
    const failure = Failure(message: "Invalid OTP");

    when(mockAuthRepository.verifyOTP(otpRequest))
        .thenAnswer((_) async => const Left(failure));

    // Act
    final result = await verifyOtpUsecase.call(otpRequest);

    // Assert
    expect(result, const Left(failure));
    verify(mockAuthRepository.verifyOTP(otpRequest)).called(1);
    verifyNoMoreInteractions(mockAuthRepository);
  });
}
