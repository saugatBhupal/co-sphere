import 'package:cosphere/src/core/models/local/user_hive_model.dart';
import 'package:cosphere/src/features/authentication/domain/usecases/signin_usecase.dart';
import 'package:cosphere/src/features/authentication/domain/usecases/signup_usecase.dart';

abstract class AuthLocalDataSource {
  Future<UserHiveModel> signUp(SignupParams params);
  Future<UserHiveModel> signIn(SigninParams params);
}
