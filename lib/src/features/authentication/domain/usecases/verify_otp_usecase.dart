import 'package:cosphere/src/core/domain/usecases/base_usecase.dart';
import 'package:cosphere/src/core/error/failure.dart';
import 'package:cosphere/src/features/authentication/data/dto/otp/otp_request_dto.dart';
import 'package:cosphere/src/features/authentication/domain/repositories/auth_repository.dart';
import 'package:dartz/dartz.dart';

class VerifyOtpUsecase implements UsecaseWithParams<String, OtpRequestDto> {
  final AuthRepository authRepository;

  VerifyOtpUsecase({required this.authRepository});
  @override
  Future<Either<Failure, String>> call(OtpRequestDto params) {
    return authRepository.verifyOTP(params);
  }
}
