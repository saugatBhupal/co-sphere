import 'package:cosphere/src/core/models/remote/UserApiModel.dart';
import 'package:cosphere/src/features/authentication/data/dto/sign_up_request_dto.dart';
import 'package:cosphere/src/features/authentication/domain/usecases/signin_usecase.dart';

abstract class AuthRemoteDatasource {
  Future<String> signUp(SignUpRequestDto dto);
  Future<UserApiModel> signIn(SigninParams params);
}
