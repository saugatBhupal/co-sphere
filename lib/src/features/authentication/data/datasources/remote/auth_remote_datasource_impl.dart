import 'package:cosphere/src/core/models/remote/UserApiModel.dart';
import 'package:cosphere/src/features/authentication/data/datasources/remote/auth_remote_datasource.dart';
import 'package:cosphere/src/features/authentication/domain/usecases/signin_usecase.dart';
import 'package:cosphere/src/features/authentication/domain/usecases/signup_usecase.dart';

class AuthRemoteDatasourceImpl implements AuthRemoteDatasource {
  @override
  Future<UserApiModel> signIn(SigninParams params) {
    // TODO: implement signIn
    throw UnimplementedError();
  }

  @override
  Future<void> signUp(SignupParams params) {
    // TODO: implement signUp
    throw UnimplementedError();
  }
}
