import 'package:cosphere/src/core/models/remote/UserApiModel.dart';
import 'package:cosphere/src/features/authentication/domain/usecases/signin_usecase.dart';
import 'package:cosphere/src/features/authentication/domain/usecases/signup_usecase.dart';

abstract class AuthRemoteDatasource {
  Future<void> signUp(SignupParams params);
  Future<UserApiModel> signIn(SigninParams params);
}
