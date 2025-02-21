import 'package:cosphere/src/core/error/failure.dart';
import 'package:cosphere/src/core/http/api_endpoints.dart';
import 'package:cosphere/src/core/http/handle_error_response.dart';
import 'package:cosphere/src/core/models/remote/user_api_model.dart';
import 'package:cosphere/src/features/dashboard/data/datasources/remote/dashboard_remote_datasource.dart';
import 'package:cosphere/src/features/project/data/models/project_api_model.dart';
import 'package:dio/dio.dart';

class DashboardRemoteDatasourceImpl implements DashboardRemoteDatasource {
  final Dio dio;

  DashboardRemoteDatasourceImpl({required this.dio});

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

  @override
  Future<List<ProjectApiModel>> getProjectsByUser(String uid) async {
    try {
      var res = await dio.get("${ApiEndpoints.getProjectUser}$uid");
      if (res.statusCode == 200) {
        print(res.data);
        final List<ProjectApiModel> projects = (res.data as List<dynamic>)
            .map((json) =>
                ProjectApiModel.fromJson(json as Map<String, dynamic>))
            .toList();
        return projects;
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
