import 'package:cosphere/src/core/models/local/user_hive_model.dart';
import 'package:cosphere/src/features/authentication/data/dto/sign_up_request_dto.dart';
import 'package:cosphere/src/features/authentication/domain/usecases/signin_usecase.dart';

abstract class AuthLocalDataSource {
  Future<UserHiveModel> signUp(SignUpRequestDto params);
  Future<UserHiveModel> signIn(SigninParams params);
}
