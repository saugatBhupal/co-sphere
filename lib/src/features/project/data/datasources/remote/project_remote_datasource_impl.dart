import 'package:cosphere/src/core/error/failure.dart';
import 'package:cosphere/src/core/http/api_endpoints.dart';
import 'package:cosphere/src/core/http/handle_error_response.dart';
import 'package:cosphere/src/features/project/data/datasources/remote/project_remote_datasource.dart';
import 'package:cosphere/src/features/project/data/models/project_api_model.dart';
import 'package:dio/dio.dart';

class ProjectRemoteDatasourceImpl implements ProjectRemoteDatasource {
  final Dio dio;

  ProjectRemoteDatasourceImpl({required this.dio});

  @override
  Future<String> finishHiring(String uid) {
    // TODO: implement finishHiring
    throw UnimplementedError();
  }

  @override
  Future<List<ProjectApiModel>> getActiveProjectsByUser(String uid) async {
    try {
      var res = await dio.get("${ApiEndpoints.getActive}$uid");
      if (res.statusCode == 200) {
        return (res.data as List)
            .map((json) => ProjectApiModel.fromJson(json))
            .toList();
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
  Future<List<ProjectApiModel>> getCompletedProjectsByUser(String uid) async {
    try {
      var res = await dio.get("${ApiEndpoints.getCompleted}$uid");
      if (res.statusCode == 200) {
        return (res.data as List)
            .map((json) => ProjectApiModel.fromJson(json))
            .toList();
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
  Future<List<ProjectApiModel>> getHiringProjectsByUser(String uid) async {
    try {
      var res = await dio.get("${ApiEndpoints.getHiring}$uid");
      if (res.statusCode == 200) {
        return (res.data as List)
            .map((json) => ProjectApiModel.fromJson(json))
            .toList();
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
  Future<String> hireUser(List<String> uid) {
    // TODO: implement hireUser
    throw UnimplementedError();
  }

  @override
  Future<String> rejectUser(List<String> uid) {
    // TODO: implement rejectUser
    throw UnimplementedError();
  }
}
