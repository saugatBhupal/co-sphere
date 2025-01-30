import 'package:cosphere/src/core/error/failure.dart';
import 'package:cosphere/src/core/http/api_endpoints.dart';
import 'package:cosphere/src/core/http/handle_error_response.dart';
import 'package:cosphere/src/core/models/remote/UserApiModel.dart';
import 'package:cosphere/src/features/authentication/data/datasources/remote/auth_remote_datasource.dart';
import 'package:cosphere/src/features/authentication/data/dto/sign_up_request_dto.dart';
import 'package:cosphere/src/features/authentication/domain/usecases/signin_usecase.dart';
import 'package:dio/dio.dart';

class AuthRemoteDatasourceImpl implements AuthRemoteDatasource {
  final Dio dio;

  AuthRemoteDatasourceImpl({required this.dio});
  @override
  Future<UserApiModel> signIn(SigninParams params) {
    // TODO: implement signIn
    throw UnimplementedError();
  }

  @override
  Future<String> signUp(SignUpRequestDto dto) async {
    try {
      var res = await dio.post(ApiEndpoints.register, data: dto.toJson());
      print("res $res");
      if (res.statusCode == 200) {
        return res.data["data"]["email"];
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
