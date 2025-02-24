import 'package:cosphere/src/core/error/failure.dart';
import 'package:cosphere/src/core/http/api_endpoints.dart';
import 'package:cosphere/src/core/http/handle_error_response.dart';
import 'package:cosphere/src/core/models/remote/user_api_model.dart';
import 'package:cosphere/src/features/dashboard/data/datasources/local/dashboard_local_datasource.dart';
import 'package:cosphere/src/features/dashboard/data/datasources/remote/dashboard_remote_datasource.dart';
import 'package:cosphere/src/features/project/data/models/remote/project_api_model.dart';
import 'package:dio/dio.dart';

class DashboardRemoteDatasourceImpl implements DashboardRemoteDatasource {
  final Dio dio;
  final DashboardLocalDatasource dashboardLocalDatasource;

  DashboardRemoteDatasourceImpl(
      {required this.dio, required this.dashboardLocalDatasource});

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
