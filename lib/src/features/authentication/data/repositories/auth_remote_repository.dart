import 'package:cosphere/src/core/domain/entities/user.dart';
import 'package:cosphere/src/core/domain/mappers/remote/user_mappers.dart';
import 'package:cosphere/src/core/error/failure.dart';
import 'package:cosphere/src/core/models/remote/UserApiModel.dart';
import 'package:cosphere/src/features/authentication/data/datasources/remote/auth_remote_datasource.dart';
import 'package:cosphere/src/features/authentication/data/dto/create_password/create_password_request_dto.dart';
import 'package:cosphere/src/features/authentication/data/dto/otp/otp_request_dto.dart';
import 'package:cosphere/src/features/authentication/data/dto/sign_in/sign_in_request_dto.dart';
import 'package:cosphere/src/features/authentication/data/dto/sign_up/sign_up_request_dto.dart';
import 'package:cosphere/src/features/authentication/domain/repositories/auth_repository.dart';
import 'package:dartz/dartz.dart';

class AuthRemoteRepository implements AuthRepository {
  final AuthRemoteDatasource authRemoteDatasource;

  AuthRemoteRepository({required this.authRemoteDatasource});
  @override
  Future<Either<Failure, User>> signin(SigninRequestDto signInParams) async {
    try {
      final UserApiModel userApiModel =
          await authRemoteDatasource.signIn(signInParams);
      return Right(userApiModel.toDomain());
    } catch (e) {
      return Left(Failure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, String>> signup(SignUpRequestDto signUpDto) async {
    try {
      final String email = await authRemoteDatasource.signUp(signUpDto);
      return Right(email);
    } catch (e) {
      return Left(Failure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, String>> verifyOTP(OtpRequestDto dto) async {
    try {
      final String message = await authRemoteDatasource.verifyOTP(dto);
      return Right(message);
    } catch (e) {
      return Left(Failure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, String>> createPassword(
      CreatePasswordRequestDto dto) async {
    try {
      final String message = await authRemoteDatasource.createPassword(dto);
      return Right(message);
    } catch (e) {
      return Left(Failure(message: e.toString()));
    }
  }
}
