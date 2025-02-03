import 'package:cosphere/src/core/error/failure.dart';
import 'package:cosphere/src/core/http/api_endpoints.dart';
import 'package:cosphere/src/core/http/handle_error_response.dart';
import 'package:cosphere/src/core/models/remote/user_api_model.dart';
import 'package:cosphere/src/features/splash/data/datasources/remote/splash_remote_datasource.dart';
import 'package:dio/dio.dart';

class SplashRemoteDatasourceImpl implements SplashRemoteDatasource {
  final Dio dio;

  SplashRemoteDatasourceImpl({required this.dio});

  @override
  Future<UserApiModel?> getCurrentUser(String? uid) async {
    try {
      final res = await dio.get("${ApiEndpoints.fetchUserByID}$uid");
      if (res.statusCode == 200) {
        final data = res.data['data'];
        final UserApiModel userApiModel = UserApiModel.fromJson(data);
        return userApiModel;
      } else {
        throw Failure(
          message: res.statusMessage.toString(),
          statusCode: res.statusCode.toString(),
        );
      }
    } on DioException catch (e) {
      return await handleErrorResponse(e);
    }
  }
}
