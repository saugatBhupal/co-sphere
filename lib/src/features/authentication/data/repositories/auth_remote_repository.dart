import 'package:cosphere/src/core/domain/entities/user.dart';
import 'package:cosphere/src/core/error/failure.dart';
import 'package:cosphere/src/features/authentication/domain/repositories/auth_repository.dart';
import 'package:cosphere/src/features/authentication/domain/usecases/signin_usecase.dart';
import 'package:cosphere/src/features/authentication/domain/usecases/signup_usecase.dart';
import 'package:dartz/dartz.dart';

class AuthRemoteRepository implements AuthRepository {
  @override
  Future<Either<Failure, User>> signin(SigninParams signInParams) {
    // TODO: implement signin
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, void>> signup(SignupParams signUpParams) {
    // TODO: implement signup
    throw UnimplementedError();
  }
}
