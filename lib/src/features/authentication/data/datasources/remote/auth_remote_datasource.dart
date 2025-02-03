import 'package:cosphere/src/core/models/remote/user_api_model.dart';
import 'package:cosphere/src/features/authentication/data/dto/create_password/create_password_request_dto.dart';
import 'package:cosphere/src/features/authentication/data/dto/otp/otp_request_dto.dart';
import 'package:cosphere/src/features/authentication/data/dto/sign_in/sign_in_request_dto.dart';
import 'package:cosphere/src/features/authentication/data/dto/sign_up/sign_up_request_dto.dart';

abstract class AuthRemoteDatasource {
  Future<String> signUp(SignUpRequestDto dto);
  Future<String> verifyOTP(OtpRequestDto dto);
  Future<String> createPassword(CreatePasswordRequestDto dto);
  Future<UserApiModel> signIn(SigninRequestDto params);
}
