import 'package:cosphere/src/core/domain/entities/user.dart';
import 'package:cosphere/src/core/error/failure.dart';
import 'package:cosphere/src/features/authentication/data/dto/create_password/create_password_request_dto.dart';
import 'package:cosphere/src/features/authentication/data/dto/otp/otp_request_dto.dart';
import 'package:cosphere/src/features/authentication/data/dto/sign_in/sign_in_request_dto.dart';
import 'package:cosphere/src/features/authentication/data/dto/sign_up/sign_up_request_dto.dart';
import 'package:dartz/dartz.dart';

abstract interface class AuthRepository {
  Future<Either<Failure, String>> signup(SignUpRequestDto signUpDto);
  Future<Either<Failure, String>> verifyOTP(OtpRequestDto dto);
  Future<Either<Failure, String>> createPassword(CreatePasswordRequestDto dto);
  Future<Either<Failure, User>> signin(SigninRequestDto dto);
}
