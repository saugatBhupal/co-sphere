import 'package:cosphere/src/core/domain/entities/user.dart';
import 'package:cosphere/src/core/domain/mappers/local/user_mappers.dart';
import 'package:cosphere/src/core/error/failure.dart';
import 'package:cosphere/src/core/models/local/user_hive_model.dart';
import 'package:cosphere/src/features/authentication/data/datasources/local/auth_local_datasource.dart';
import 'package:cosphere/src/features/authentication/data/dto/create_password/create_password_request_dto.dart';
import 'package:cosphere/src/features/authentication/data/dto/otp/otp_request_dto.dart';
import 'package:cosphere/src/features/authentication/data/dto/sign_in/sign_in_request_dto.dart';
import 'package:cosphere/src/features/authentication/data/dto/sign_up/sign_up_request_dto.dart';
import 'package:cosphere/src/features/authentication/domain/repositories/auth_repository.dart';

import 'package:dartz/dartz.dart';

class AuthLocalRepository implements AuthRepository {
  final AuthLocalDataSource authLocalDataSource;

  AuthLocalRepository({required this.authLocalDataSource});
  @override
  Future<Either<Failure, User>> signin(SigninRequestDto signInParams) async {
    try {
      final UserHiveModel userHiveModel =
          await authLocalDataSource.signIn(signInParams);
      return Right(userHiveModel.toDomain());
    } catch (e) {
      return Left(Failure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, String>> signup(SignUpRequestDto signUpParams) async {
    try {
      final UserHiveModel userHiveModel =
          await authLocalDataSource.signUp(signUpParams);
      final String email = userHiveModel.email;
      return Right(email);
    } catch (e) {
      return Left(Failure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, String>> createPassword(CreatePasswordRequestDto dto) {
    // TODO: implement createPassword
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, String>> verifyOTP(OtpRequestDto dto) {
    // TODO: implement verifyOTP
    throw UnimplementedError();
  }
}
