import 'package:cosphere/src/core/error/failure.dart';
import 'package:cosphere/src/core/http/api_endpoints.dart';
import 'package:cosphere/src/core/http/handle_error_response.dart';
import 'package:cosphere/src/core/models/remote/UserApiModel.dart';
import 'package:cosphere/src/features/authentication/data/datasources/remote/auth_remote_datasource.dart';
import 'package:cosphere/src/features/authentication/data/dto/create_password/create_password_request_dto.dart';
import 'package:cosphere/src/features/authentication/data/dto/otp/otp_request_dto.dart';
import 'package:cosphere/src/features/authentication/data/dto/sign_in/sign_in_request_dto.dart';
import 'package:cosphere/src/features/authentication/data/dto/sign_in/sign_in_response_dto.dart';
import 'package:cosphere/src/features/authentication/data/dto/sign_up/sign_up_request_dto.dart';
import 'package:dio/dio.dart';

class AuthRemoteDatasourceImpl implements AuthRemoteDatasource {
  final Dio dio;

  AuthRemoteDatasourceImpl({required this.dio});

  @override
  Future<String> signUp(SignUpRequestDto dto) async {
    try {
      var res = await dio.post(ApiEndpoints.register, data: dto.toJson());
      if (res.statusCode == 200) {
        return res.data["message"];
      } else {
        throw Failure(
          message: res.statusMessage.toString(),
          statusCode: res.statusMessage.toString(),
        );
      }
    } on DioException catch (e) {
      return await handleErrorResponse(e);
    }
  }

  @override
  Future<String> verifyOTP(OtpRequestDto dto) async {
    try {
      var res = await dio.post(ApiEndpoints.verifyOtp, data: dto.toJson());
      if (res.statusCode == 200) {
        return res.data["message"];
      } else {
        throw Failure(
          message: res.statusMessage.toString(),
          statusCode: res.statusMessage.toString(),
        );
      }
    } on DioException catch (e) {
      return await handleErrorResponse(e);
    }
  }

  @override
  Future<String> createPassword(CreatePasswordRequestDto dto) async {
    try {
      var res = await dio.post(ApiEndpoints.createPassword, data: dto.toJson());
      if (res.statusCode == 200) {
        return res.data["message"];
      } else {
        throw Failure(
          message: res.statusMessage.toString(),
          statusCode: res.statusMessage.toString(),
        );
      }
    } on DioException catch (e) {
      return await handleErrorResponse(e);
    }
  }

  @override
  Future<UserApiModel> signIn(SigninRequestDto params) async {
    try {
      var res = await dio.post(ApiEndpoints.login, data: params.toJson());
      if (res.statusCode == 200) {
        SignInResponseDto signInResponseDto =
            SignInResponseDto.fromJson(res.data);
        print("Res data ${res.data}");
        // final UserSharedPref userSharedPref = UserSharedPref();
        // userSharedPref.setUserToken(signInResponseDto.token);
        return signInResponseDto.data;
      } else {
        throw Failure(
          message: res.statusMessage.toString(),
          statusCode: res.statusMessage.toString(),
        );
      }
    } on DioException catch (e) {
      return await handleErrorResponse(e);
    }
  }
}
