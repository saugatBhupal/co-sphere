import 'package:cosphere/src/core/domain/entities/user.dart';
import 'package:cosphere/src/core/error/failure.dart';
import 'package:cosphere/src/core/models/remote/UserApiModel.dart';
import 'package:cosphere/src/features/authentication/data/datasources/remote/auth_remote_datasource.dart';
import 'package:cosphere/src/features/authentication/data/dto/sign_up_request_dto.dart';
import 'package:cosphere/src/features/authentication/domain/repositories/auth_repository.dart';
import 'package:cosphere/src/features/authentication/domain/usecases/signin_usecase.dart';
import 'package:dartz/dartz.dart';

class AuthRemoteRepository implements AuthRepository {
  final AuthRemoteDatasource authRemoteDatasource;

  AuthRemoteRepository({required this.authRemoteDatasource});
  @override
  Future<Either<Failure, User>> signin(SigninParams signInParams) {
    throw UnimplementedError();
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
}
