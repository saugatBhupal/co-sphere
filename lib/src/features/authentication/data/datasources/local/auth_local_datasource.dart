import 'package:cosphere/src/core/models/local/user_hive_model.dart';
import 'package:cosphere/src/features/authentication/data/dto/sign_in/sign_in_request_dto.dart';
import 'package:cosphere/src/features/authentication/data/dto/sign_up/sign_up_request_dto.dart';


abstract class AuthLocalDataSource {
  Future<UserHiveModel> signUp(SignUpRequestDto params);
  Future<UserHiveModel> signIn(SigninRequestDto params);
}
